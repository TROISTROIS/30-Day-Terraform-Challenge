resource "aws_instance" "instance_region1" {
    provider = aws.region1
    ami = data.aws_ami.ubuntu_region1.id
    instance_type = "t3.micro"
}

resource "aws_instance" "instance_region2" {
    provider = aws.region2
    ami = data.aws_ami.ubuntu_region2.id
    instance_type = "t3.micro"
}