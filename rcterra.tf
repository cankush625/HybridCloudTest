provider "kubernetes" {
    config_context_cluster = "minikube"
}

resource "kubernetes_replication_controller" "myrc1" {
    metadata {
        name = "rc11"
    }

    spec {
        replicas = 3
        selector = {
            env = "dev",
            dc = "IN",
            app = "website",
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