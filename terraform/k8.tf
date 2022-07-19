# Creating namespace with the Kubernetes provider is better than auto-creation in the helm_release.
# You can reuse the namespace and customize it with quotas and labels.
resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = var.namespace
  }
}

resource "helm_release" "app1"{
    name ="app1"
    chart = "../charts/svc1"
}

resource "helm_release" "ambassador" {
  chart      = "ambassador"
  name       = "ambassador"
  namespace  = var.namespace
  repository = "stable/ambassador"
}

resource "helm_release" "prometheus" {
  chart      = "prometheus"
  name       = "prometheus"
  namespace  = var.namespace
  repository = "https://prometheus-community.github.io/helm-charts"
  version    = "15.5.3"

  set {
    name  = "podSecurityPolicy.enabled"
    value = true
  }

  set {
    name  = "server.persistentVolume.enabled"
    value = false
  }

  # You can provide a map of value using yamlencode. Don't forget to escape the last element after point in the name
  set {
    name = "server\\.resources"
    value = yamlencode({
      limits = {
        cpu    = "200m"
        memory = "50Mi"
      }
      requests = {
        cpu    = "100m"
        memory = "30Mi"
      }
    })
  }
}