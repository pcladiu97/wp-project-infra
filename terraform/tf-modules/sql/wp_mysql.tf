resource "google_sql_database_instance" "wp_mysql_instance" {
  name             = "${var.project_id}-mysql-instance"
  region           = var.project_region
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"
    ip_configuration {
      ipv4_enabled    = true
      private_network = var.network.self_link
    }
  }

  deletion_protection  = "false"
}

resource "google_sql_database" "wp_mysql_db" {
  name     = var.wp_mysql_db_name
  instance = google_sql_database_instance.wp_mysql_instance.name
}

resource "google_sql_user" "wp_mysql_db_user" {
  name     = var.wp_mysql_db_user
  password = var.wp_mysql_db_password
  instance = google_sql_database_instance.wp_mysql_instance.name
}