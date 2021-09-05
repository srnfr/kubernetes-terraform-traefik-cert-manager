resource "digitalocean_domain" "default" {
  name = "bluetrusty.eu"
}

resource "digitalocean_record" "traefik" {
  domain = digitalocean_domain.default.name
  type   = "A"
  name   = "traefik"
  value  = "192.168.0.11"
}

resource "digitalocean_record" "whoami" {
  domain = digitalocean_domain.default.name
  type   = "A"
  name   = "whoami"
  value  = "192.168.0.11"
}
