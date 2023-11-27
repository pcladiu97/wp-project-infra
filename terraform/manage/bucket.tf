# resource "google_storage_bucket" "tf_state_bucket" {
#     name      = "${var.project_id}-tf-state-bucket"
#     location  = var.project_region

#     versioning {
#       enabled = true
#     }
# }