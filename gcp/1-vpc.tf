resource "google_compute_network" "vpc2" {
  name    = "vpc2"
  project = "fyp-a08"
  auto_create_subnetworks = false
  
}

resource "google_compute_subnetwork" "subnet3" {
  project       = "fyp-a08"
  name          = "subnet3"
  ip_cidr_range = "10.1.1.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc2.id
}

resource "google_compute_subnetwork" "subnet4" {
  project = "fyp-a08"
  name          = "subnet4"
  ip_cidr_range = "10.1.2.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc2.id
}