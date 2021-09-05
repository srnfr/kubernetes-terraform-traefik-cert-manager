# Variable declaration
variable "cluster_name" {
  type        = string
  description = "Cluster name that will be created."
}
variable "cluster_region" {
  type        = string
  description = "Cluster region."
}
variable "cluster_tags" {
  type        = list(string)
  description = "Cluster tags."
}
##
variable "cluster_prefix" {
  type        = string
  description = "Cluster tags."
}
variable "cluster_environment" {
  type        = string
  description = "Cluster tags."
}
##
variable "node_size" {
  type        = string
  description = "The size of the nodes in the cluster."
}
variable "node_max_count" {
  type        = number
  description = "Maximum amount of nodes in the cluster."
}
variable "node_min_count" {
  type        = number
  description = "Minimum amount of nodes in the cluster."
}

# Enable auto upgrade patch versions
data "digitalocean_kubernetes_versions" "do_cluster_version" {
  version_prefix = "1.19."
}

# Create the cluster with autoscaling on
resource "digitalocean_kubernetes_cluster" "do_cluster" {
  name         = var.cluster_name
##  name = "{$terraform.workspace}" <= ne marche pas avec TFC , default utilise
  name = "${cluster_prefix}-${cluster_environment}-{$cluster_region}" 
  region       = var.cluster_region
  auto_upgrade = true
  version      = data.digitalocean_kubernetes_versions.do_cluster_version.latest_version
  tags         = var.cluster_tags

  node_pool {
    name       = "${var.cluster_name}-pool"
    size       = var.node_size
    min_nodes  = var.node_min_count
    max_nodes  = var.node_max_count
    auto_scale = true
  }
}

# Load and connect to Kubernetes
provider "kubernetes" {
  ##version          = "~> 1.13.3"
  ##load_config_file = false
  host             = digitalocean_kubernetes_cluster.do_cluster.endpoint
  token            = digitalocean_kubernetes_cluster.do_cluster.kube_config[0].token
  cluster_ca_certificate = base64decode(
    digitalocean_kubernetes_cluster.do_cluster.kube_config[0].cluster_ca_certificate
  )
}

# Load and connect to Helm
provider "helm" {
  kubernetes {
    #load_config_file = false
    host             = digitalocean_kubernetes_cluster.do_cluster.endpoint
    token            = digitalocean_kubernetes_cluster.do_cluster.kube_config[0].token
    cluster_ca_certificate = base64decode(
      digitalocean_kubernetes_cluster.do_cluster.kube_config[0].cluster_ca_certificate
    )
  }
  ##version = "~> 1.3.2"
}
