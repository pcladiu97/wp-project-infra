resource "google_sql_database_instance" "wp_mysql_instance" {
  name             = "wp-mysql-instance"
  region           = var.project_region
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"
  }

  deletion_protection  = "false"
}

resource "google_sql_database" "wp_mysql_db" {
  name     = data.google_secret_manager_secret_version.mysql_db_name.secret_data
  instance = google_sql_database_instance.wp_mysql_instance.name
}

resource "google_sql_user" "wp_mysql_db_user" {
  name     = data.google_secret_manager_secret_version.mysql_db_username.secret_data
  instance = google_sql_database_instance.wp_mysql_instance.name
  password = data.google_secret_manager_secret_version.mysql_db_password.secret_data
}