data "terraform_remote_state" "db" {
    backend = "s3"
    config = {
    bucket = var.db_remote_state_bucket
    key = var.db_remote_state_key
    profile = "IAMAdmin-GEN"
    region = "us-east-1"
    }
}
