# 1 Backend variables
do_token                              = "478a6caadccff13b813488fc35ef16e1da38e7ce03ddca3c6dc7cb6464f29cd1"

# 2 Cluster variables
cluster_name                          = "my-special-cluster"
cluster_region                        = "ams3"
cluster_tags                          = ["foo", "development"]
node_size                             = "s-1vcpu-2gb"
node_min_count                        = 2
node_max_count                        = 4

# 3 Ingress variables
ingress_gateway_chart_name            = "traefik"
ingress_gateway_chart_repo            = "https://helm.traefik.io/traefik"
ingress_gateway_chart_version         = "9.8.3"

# 4 Cert manager variables
cert_manager_chart_name               = "cert-manager"
cert_manager_chart_repo               = "https://charts.jetstack.io"
cert_manager_chart_version            = "1.0.4"