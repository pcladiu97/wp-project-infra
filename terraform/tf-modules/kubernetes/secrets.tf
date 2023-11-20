resource "kubernetes_secret" "wp_registry_sa_secret" {
  metadata {
    name      = "registry-sa"
    namespace = var.wp_namespace
  }

  data = {
    ".dockerconfigjson" = var.registry_sa_secret_data
  }

  type = "kubernetes.io/dockerconfigjson"
}

resource "kubernetes_secret" "aspnet_registry_sa_secret" {
  metadata {
    name      = "registry-sa"
    namespace = var.aspnet_namespace
  }

  data = {
    ".dockerconfigjson" = var.registry_sa_secret_data
  }

  type = "kubernetes.io/dockerconfigjson"
}

// mysql secret
resource "kubernetes_secret" "wp_mysql_secret" {
  metadata {
    name      = "mysql"
    namespace = var.wp_namespace
  }

  data = {
    "db_host"     = var.wp_mysql_db_host
    "db_name"     = var.wp_mysql_db_name
    "db_username" = var.wp_mysql_db_user
    "db_password" = var.wp_mysql_db_password
  }

  type = "Opaque"
}
