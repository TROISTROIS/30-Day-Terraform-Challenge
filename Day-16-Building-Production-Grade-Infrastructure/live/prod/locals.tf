locals {
    account_ids = {
        Stage      = "589335871435"   
        Production = "966392475043"   
        }
    http_protocol = "HTTP"
    Server_Port = 8080
    VPC_CIDR = var.environment == "Production" ? "10.1.0.0/16" : "10.0.0.0/16"
    enable_autoscaling = var.environment == "Production"
    common_tags = {
        environment = var.environment
        ManagedBy   = "terraform"
        Project     = "Day-${var.day}"
    }
}