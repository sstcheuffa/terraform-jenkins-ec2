data "aws_caller_identity" "current" {}

data "aws_ami" "ec2_instance" {
  most_recent = true

  filter {
    name   = "virtualization-type"
    values = ["ami-026b57f3c383c2eec", "hvm"]
  }

  owners = ["${data.aws_caller_identity.current.account_id}"]
}

resource "aws_instance" "web" {
  ami           = "${data.aws_ami.ec2_instance.id}"
  #ami = "ami-026b57f3c383c2eec"
  instance_type = "t2.micro"

  tags = {
    Name = "EC2 Demo Instance"
  }
}
