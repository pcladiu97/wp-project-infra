data "google_container_engine_versions" "gke_version" {
  location = var.project_zone
  version_prefix = "1.27."
}

resource "google_container_cluster" "wp_project_cluster" {
  name     = "${var.project_id}-gke-cluster"
  location = var.project_zone

  remove_default_node_pool = true
  initial_node_count       = 1

  deletion_protection = false

  network    = var.network.self_link
  subnetwork = var.subnetwork.self_link
}

resource "google_container_node_pool" "wp_project_cluster_nodes" {
  name            = google_container_cluster.wp_project_cluster.name
  location        = var.project_zone
  cluster         = google_container_cluster.wp_project_cluster.name

  version    = data.google_container_engine_versions.gke_version.release_channel_latest_version["STABLE"]
  node_count = var.gke_nodes_number

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels = {
      env = var.project_id
    }
    machine_type = "n1-standard-1"
    disk_size_gb = 50
    disk_type = "pd-standard"
    tags         = ["gke-node", "${var.project_id}-gke"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}