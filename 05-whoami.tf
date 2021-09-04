# Create whoami namespace
resource "kubernetes_namespace" "whoami_namespace" {
  metadata {
    annotations = {
      name = "whoami"
    }
    name = "whoami"
  }
}
