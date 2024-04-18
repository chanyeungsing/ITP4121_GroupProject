resource "google_service_account" "k8sserviceaccount" {
  project = "fyp-a08"
  account_id   = "k8sserviceaccount"
  display_name = "k8s service account"
}

resource "google_container_cluster" "k8s1" {
  project = "fyp-a08"
  name               = "k8s1"
  location           = "us-central1-a"
  initial_node_count = 2
  node_config {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.k8sserviceaccount.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    labels = {
      foo = "bar"
    }
    tags = ["foo", "bar"]
  }
  timeouts {
    create = "30m"
    update = "40m"
  }
}