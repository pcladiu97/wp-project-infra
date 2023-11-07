data "google_secret_manager_secret_version" "registry_sa_secret_data" {
 secret   = "projects/440219679769/secrets/registry-sa"
}

resource "kubernetes_secret" "registry_sa_secret" {
  metadata {
    name      = "registry-sa"
    namespace = "wp"
  }

  data = {
    ".dockerconfigjson" = data.google_secret_manager_secret_version.registry_sa_secret_data.secret_data
  }

  type = "kubernetes.io/dockerconfigjson"
}
