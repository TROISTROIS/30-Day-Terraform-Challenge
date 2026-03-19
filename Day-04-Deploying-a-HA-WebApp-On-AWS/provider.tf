provider "aws" {
    profile = "IAMAdmin-GEN"
    region = data.aws_region.current.name
}