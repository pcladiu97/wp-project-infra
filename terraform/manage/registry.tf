resource "google_artifact_registry_repository" "wp-project-infra-registry" {
  location      = var.project_region
  repository_id = "wp-project-infra-registry"
  description   = "Docker registry"
  format        = "DOCKER"

  docker_config {
    immutable_tags = false
  }
}

resource "google_artifact_registry_repository" "aspnet-project-infra-registry" {
  location      = var.project_region
  repository_id = "aspnet-project-infra-registry"
  description   = "Docker registry"
  format        = "DOCKER"

  docker_config {
    immutable_tags = false
  }
}
