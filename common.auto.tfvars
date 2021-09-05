# 1 Backend variables
#do_token                              = "<your-token>"

# 2 Cluster variables
##cluster_name                          = "my-special-cluster"
##cluster_region                        = "ams3"
cluster_prefix                        = "k"
cluster_tags                          = ["demo", "development"]
node_size                             = "s-1vcpu-2gb"
node_min_count                        = 2
node_max_count                        = 4

# 3 Ingress variables
ingress_gateway_chart_name            = "traefik"
ingress_gateway_chart_repo            = "https://helm.traefik.io/traefik"
##ingress_gateway_chart_version         = "9.8.3"

# 4 Cert manager variables
cert_manager_chart_name               = "cert-manager"
cert_manager_chart_repo               = "https://charts.jetstack.io"
##cert_manager_chart_version            = "1.0.4"
