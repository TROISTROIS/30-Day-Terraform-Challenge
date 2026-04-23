data "terraform_remote_state" "db" {
    backend = "s3"
    
    config = {
    bucket = "backend-bucket-zn"
    key = "stage/data-stores/mysql/terraform.tfstate"
    profile = "IAMAdmin-GEN"
    region = "us-east-1"
    }
}

provider "aws" {
    region = "us-east-1"
    profile = "IAMAdmin-GEN"
}

module "webserver-cluster" {
    source = "../../../Modules/Services/webserver-cluster"

    cluster_name = "webserver-day8"
    instance_type = "t2.micro"
    db_endpoint = data.terraform_remote_state.db.outputs.address
    db_port = data.terraform_remote_state.db.outputs.port
}