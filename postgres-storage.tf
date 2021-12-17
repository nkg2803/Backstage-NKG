resource "kubernetes_persistent_volume" "postgres_storage" {
  metadata {
    name = "postgres-storage"

    labels = {
      type = "local"
    }
  }

  spec {
    capacity = {
      storage = "2G"
    }

    access_modes                     = ["ReadWriteOnce"]
    persistent_volume_source {
      gce_persistent_disk {
        pd_name = "my-data-disk"
      }
    }  
    persistent_volume_reclaim_policy = "Retain"
    storage_class_name               = "manual"
  }
}

resource "kubernetes_persistent_volume_claim" "postgres_storage_claim" {
  metadata {
    name      = "postgres-storage-claim"
    namespace = "backstage"
  }

  spec {
    access_modes = ["ReadWriteOnce"]

    resources {
      requests = {
        storage = "2G"
      }
    }

    storage_class_name = "manual"
  }
}