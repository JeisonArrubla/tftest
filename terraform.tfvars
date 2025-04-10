ohio_cidr = "10.0.0.0/16"

subnets_cidr = {
  "public_subnet"  = "10.0.1.0/24"
  "private_subnet" = "10.0.2.0/24"
}

tags = {
  "env"         = "test"
  "owner"       = "Jeison"
  "cloud"       = "AWS"
  "IAC"         = "Terraform"
  "IAC_version" = "1.11.3"
}

ingress_cidr_sg = "0.0.0.0/0"

ec2_specs = {
  "ami"           = "ami-0100e595e1cc1ff7f"
  "instance_type" = "t2.micro"
}
