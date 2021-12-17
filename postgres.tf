resource "kubernetes_deployment" "postgres" {
  metadata {
    name      = "postgres"
    namespace = "backstage"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "postgres"
      }
    }

    template {
      metadata {
        labels = {
          app = "postgres"
        }
      }

      spec {
        volume {
          name = "postgresdb"

          persistent_volume_claim {
            claim_name = "postgres-storage-claim"
          }
        }

        container {
          name  = "postgres"
          image = "postgres:13.2-alpine"

          port {
            container_port = 5432
          }

          env_from {
            secret_ref {
              name = "postgres-secrets"
            }
          }

          volume_mount {
            name       = "postgresdb"
            mount_path = "/var/lib/postgresql/data"
            sub_path = "new"
          }

          image_pull_policy = "IfNotPresent"
        }
      }
    }
  }
}