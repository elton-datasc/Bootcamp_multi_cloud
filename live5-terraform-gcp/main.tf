terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "~> 4.37.0"
    }
  }
}

provider "google" {
    project = var.gcp_project_id
}

resource "google_container_cluster" "primary" {
  name               = "kubernetes-cluster-001"
  location           = var.gcp_region
  initial_node_count = 1
  enable_autopilot = true
  ip_allocation_policy {
  }
}


resource "google_sql_database_instance" "instance" {
  name             = "my-database-instancexxxx"
  region           = var.gcp_region
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"
  }

  deletion_protection  = "true"
}

resource "google_sql_database" "database" {
  name     = "my-database"
  instance = google_sql_database_instance.instance.name
}