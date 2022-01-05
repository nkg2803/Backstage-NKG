resource "kubernetes_service" "backstage" {
  metadata {
    name      = "backstage"
    namespace = "backstage"
  }

  spec {
    port {
      name        = "http"
      port        = 7007
      #target_port = 80
    }
    type = "LoadBalancer"

    selector = {
      app = "backstage"
    }
  }
}