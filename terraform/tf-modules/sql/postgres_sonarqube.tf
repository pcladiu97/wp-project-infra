resource "google_sql_database_instance" "sonarqube_postgres_instance" {
  name             = "${var.project_id}-sonarqube-postgres-instance"
  region           = var.project_region
  database_version = "POSTGRES_15"
  settings {
    tier = "db-f1-micro"
    ip_configuration {
      ipv4_enabled    = true
      private_network = var.network.self_link
    }
  }

  deletion_protection  = "false"
}

resource "google_sql_database" "sonarqube_postgres_db" {
  name     = var.sonarqube_postgres_db_name
  instance = google_sql_database_instance.sonarqube_postgres_instance.name
}

resource "google_sql_user" "sonarqube_postgres_db_user" {
  name     = var.sonarqube_postgres_db_user
  password = var.sonarqube_postgres_db_password
  instance = google_sql_database_instance.sonarqube_postgres_instance.name
}