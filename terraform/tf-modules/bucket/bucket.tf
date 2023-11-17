resource "google_storage_bucket" "tf_state_bucket" {
    name      = var.tf_state_bucket_name
    location  = var.project_region

    versioning {
      enabled = true
    }
}