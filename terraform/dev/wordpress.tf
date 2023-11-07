resource "kubernetes_namespace" "wp-namespace" {
  metadata {
    annotations = {
      name = "wp-namespace"
    }

    labels = {
      mylabel = "wp-namespace"
    }

    name = "wp"
  }
}