resource "kubernetes_namespace" "wp-namespace" {
  metadata {
    annotations = {
      name = "wp-namespace"
    }

    name = var.wp_namespace
  }

  depends_on = [
    google_container_node_pool.wp_project_cluster_nodes
  ]
}

resource "kubernetes_namespace" "aspnet-namespace" {
  metadata {
    annotations = {
      name = "aspnet-namespace"
    }

    name = var.aspnet_namespace
  }

  depends_on = [
    google_container_node_pool.wp_project_cluster_nodes
  ]
}

resource "kubernetes_namespace" "monitoring-namespace" {
  metadata {
    annotations = {
      name = "monitoring-namespace"
    }

    name = var.monitoring_namespace
  }
  
  depends_on = [
    google_container_node_pool.wp_project_cluster_nodes
  ]
}