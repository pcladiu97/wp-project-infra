resource "google_artifact_registry_repository" "artifact_registry" {
  for_each = toset(var.repository_names)
  
  location      = var.project_region
  repository_id = each.key
  description   = "Docker registry"
  format        = "DOCKER"

  docker_config {
    immutable_tags = false
  }
}