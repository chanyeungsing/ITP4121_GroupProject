resource "google_service_account" "vm-service_account" {
  account_id   = "myvmserveraccount"
  display_name = "Custom SA for VM Instance"
  project = "fyp-a08"
}

resource "google_compute_instance" "vm3" {

  project = "fyp-a08"
  name         = "my-instance"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }


  network_interface {
    subnetwork = google_compute_network.vpc2.name
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.vm-service_account.email
    scopes = ["cloud-platform"]
  }
}