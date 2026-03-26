resource "aws_instance" "DAY5-instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name = "Day5-instance"
  }
}