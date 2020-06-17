provider "kubernetes" {
    config_context_cluster = "minikube"
}

resource "kubernetes_pod" "myPod" {
    metadata {
        name = "mypod1"
    }

    spec {
        container {
            image = "cankush625/webpage"
            name = "mywebcon"
        }
    }
}