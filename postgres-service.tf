resource "kubernetes_service" "postgres" {
  metadata {
    name      = "postgres"
    namespace = "backstage"
  }

  spec {
    port {
      port = 5432
    }

    selector = {
      app = "postgres"
    }
  }
}