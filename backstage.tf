resource "kubernetes_deployment" "backstage" {
  metadata {
    name      = "backstage"
    namespace = "backstage"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "backstage"
      }
    }

    template {
      metadata {
        labels = {
          app = "backstage"
        }
      }

      spec {
        container {
          name  = "backstage"
          image = "roadiehq/community-backstage-image:latest"

          port {
            name           = "http"
            container_port = 7007
          }

          env_from {
            secret_ref {
              name = "postgres-secrets"
            }
          }

          env_from {
            secret_ref {
              name = "backstage-secrets"
            }
          }

          image_pull_policy = "IfNotPresent"
        }
      }
    }
  }
}