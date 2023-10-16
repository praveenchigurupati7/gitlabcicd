
# Create two external IP addresses
resource "google_compute_address" "runner-ip" {
  count = var.count
  name  = "runner-ip-${count.index + 1}"
}

resource "google_compute_instance" "gitlabrunners" {
  count = var.count
  machine_type = "e2-medium"
  zone         = "us-central1-c"
  name = "gitlab-runner-${count.index + 1}"

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }

  network_interface {
    network = "default"
    access_config {
      nat_ip = google_compute_address.runner-ip-${count.index + 1}.address
    }
  }

  # metadata_startup_script = file("startup_script.sh")

  tags = ["http-server", "https-server"]

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = var.service_account_email
    scopes = ["cloud-platform"]
  }
}