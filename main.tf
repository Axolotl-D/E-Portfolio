# Defines the provider to be used by Terraform
provider "aws" {
  region = "eu-central-1"
}

# Defines the networking part: VPC and Subnet, Internet Gateway, Route Table
# and Security Group
resource "aws_vpc" "mainvpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "mainvpc"
  }
}

resource "aws_internet_gateway" "maingw" {
  vpc_id = aws_vpc.mainvpc.id

  tags = {
    Name = "maingw"
  }
}

resource "aws_route_table" "mainrt" {
  vpc_id = aws_vpc.mainvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.maingw.id
  }

  tags = {
    Name = "mainrt"
  }
}

resource "aws_main_route_table_association" "mainrt-assoc" {
  vpc_id         = aws_vpc.mainvpc.id
  route_table_id = aws_route_table.mainrt.id
}

resource "aws_subnet" "main_subnet" {
  vpc_id     = aws_vpc.mainvpc.id
  cidr_block = "10.0.0.0/24"
}

resource "aws_security_group" "public" {
  vpc_id      = aws_vpc.mainvpc.id
  name        = "public"
  description = "HTTP,HTTPS,SSH"
}

resource "aws_security_group_rule" "public_out" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public.id
}

resource "aws_security_group_rule" "public_in_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public.id
}

resource "aws_security_group_rule" "public_in_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public.id
}

resource "aws_security_group_rule" "public_in_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public.id
}

# Defines the EC2-Instance, the virtual server running our basic web app
resource "aws_instance" "test-instance" {
  ami           = "ami-09439f09c55136ecf"
  instance_type = "t2.micro"
  tags = {
    "Name" = "HelloWorld"
  }
  key_name                    = "your-keypair-name"                   #change to your keypair
  vpc_security_group_ids      = [aws_security_group.public.id]
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.main_subnet.id
}