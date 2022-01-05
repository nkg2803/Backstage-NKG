resource "kubernetes_config_map" "postgres_configs" {
  metadata {
    name      = "postgres-configs"
    namespace = "backstage"
  }

  data = {
    POSTGRES_HOST = "postgres"

    POSTGRES_PORT = "5432"
  }
}

