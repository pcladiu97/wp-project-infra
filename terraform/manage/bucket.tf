resource "google_storage_bucket" "tf_state_bucket" {
    name      = "${local.project_id}-tf-state-bucket"
    location  = local.project_region

    versioning {
      enabled = true
    }
}