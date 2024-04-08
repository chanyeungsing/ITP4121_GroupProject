terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.23.0"
    }
  }
}

provider "google" {
  project = "terraform-419606"
  region  = "us-central1"
}

#vpc1
resource "google_compute_network" "vpc1" {
  name = "vpc1"
}

#subnet1
resource "google_compute_subnetwork" "subnet1" {
  name          = "subnet1"
  ip_cidr_range = "10.1.1.0/16"
  region        = "us-central1"
  network       = google_compute_network.vpc1.id
  /* secondary_ip_range {
    range_name    = "tf-test-secondary-range-update1"
    ip_cidr_range = "192.168.10.0/24"
  } */
}


#Service-account
resource "google_service_account" "vmsa1" {
  account_id   = "vm-serviceacount-1"
  display_name = "Custom SA for VM Instance"
}

resource "google_compute_instance" "vm1" {
  name         = "vm1"
  machine_type = "n2-standard-2"
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

  // Local SSD disk
  scratch_disk {
    interface = "NVME"
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.vmsa1.email
    scopes = ["cloud-platform"]
  }
}
