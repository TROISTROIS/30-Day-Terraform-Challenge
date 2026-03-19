# Learning data sources
data "aws_region" "current" {}
data "aws_availability_zones" "available" {}

output "region" {
    description = "AWS region"
    value = data.aws_region.current.name
}

output "AZs" {
    description = "AZs in this region"
    value = tolist(data.aws_availability_zones.available.names)
}