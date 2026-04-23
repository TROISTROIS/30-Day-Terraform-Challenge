provider "aws" {
    region = "us-east-1"
    profile = "IAMAdmin-GEN"
}

module "webserver-cluster" {
    source = "../../../Modules/Services/webserver-cluster"

    cluster_name = "webserver-day8"
    db_remote_state_bucket = "backend-bucket-zn"
    db_remote_state_key = "stage/data-stores/mysql/terraform.tfstate"
    instance_type = "t2.micro"
}