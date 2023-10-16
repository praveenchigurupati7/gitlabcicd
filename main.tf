

resource "google_compute_instance" "gitlabrunners" {
  count = 1
  machine_type = "e2-medium"
  zone         = "us-central1-c"
  name = "gitlab-runner-${count.index}"

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }

  network_interface {
    network = "default"
  }

  # metadata_startup_script = file("startup_script.sh")

  tags = ["http-server", "https-server"]

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = var.service_account_email
    scopes = ["cloud-platform"]
  }
}