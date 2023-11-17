output "network" {
  value = google_compute_network.vpc
}

output "subnetwork" {
  value = google_compute_subnetwork.subnet
}
