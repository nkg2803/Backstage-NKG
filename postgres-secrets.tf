resource "kubernetes_secret" "postgres_secrets" {
  metadata {
    name      = "postgres-secrets"
    namespace = "backstage"
  }

  data = {
    POSTGRES_PASSWORD = "aHVudGVyMg=="

    POSTGRES_USER = "YmFja3N0YWdl"
  }

  type = "Opaque"
}