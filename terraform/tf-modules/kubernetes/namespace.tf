resource "kubernetes_namespace" "wp-namespace" {
  metadata {
    annotations = {
      name = "wp-namespace"
    }

    name = var.wp_namespace
  }
}

resource "kubernetes_namespace" "aspnet-namespace" {
  metadata {
    annotations = {
      name = "aspnet-namespace"
    }

    name = var.aspnet_namespace
  }
}

resource "kubernetes_namespace" "monitoring-namespace" {
  metadata {
    annotations = {
      name = "monitoring-namespace"
    }

    name = var.monitoring_namespace
  }
}