output "region1" {
    description = "The name of Region 1"
    value = data.aws_region.region_1.name
}

output "region2" {
    description = "The name of Region 2"
    value = data.aws_region.region_2.name
}

output "instance_region1_az" {
    description = "The name of AZ in region 1"
    value = aws_instance.instance_region1.availability_zone
}

output "instance_region2_az" {
    description = "The name of AZ in region 2"
    value = aws_instance.instance_region2.availability_zone
}