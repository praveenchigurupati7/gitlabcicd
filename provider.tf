terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  project = "elevated-glow-400716"
  region  = "us-central1"
  zone    = "us-central1-c"
}
