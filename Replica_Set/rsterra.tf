provider "kubernetes" {
    config_context_cluster = "minikube"
}

resource "kubernetes_deployment" "myrs1" {
    metadata {
        name = "rs11"
    }

    spec {
        replicas = 3
        selector {
            match_expressions {
                key = "env"
                operator = "In"
                values = ["dev"]
            }
            match_expressions {
                key = "dc"
                operator = "In"
                values = ["IN"]
            }
        }

        template {
            metadata { 
                labels = {
                    env = "dev",
                    dc = "IN",
                    app = "website",
                }
                annotations = {
                    "Key" = "value"
                }
            }
            spec {
                container {
                    image = "cankush625/website"
                    name = "mywebsite"
                }
            }
        }
    }
}