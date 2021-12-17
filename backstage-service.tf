resource "kubernetes_service" "backstage" {
  metadata {
    name      = "backstage"
    namespace = "backstage"
  }

  spec {
    port {
      name        = "http"
      port        = 80
      target_port = "http"
    }

    selector = {
      app = "backstage"
    }
  }
}