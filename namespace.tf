resource "kubernetes_namespace" "backstage" {
  metadata {
    name = "backstage"
  }
}