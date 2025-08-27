vpc_cidr            = "10.0.0.0/16"
vpc_name            = "Terraform-VPC"
public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
azs                 = ["us-east-1a", "us-east-1b"]
private_subnet_cidr = "10.0.3.0/24"
key_name        = "terraform_keypai"
public_key_path = "my-keypair.pub"

instances = [
  {
    name          = "my-vpc-ec2"
    ami           = "ami-084568db4383264d4"
    instance_type = "t3.medium"
    role          = "build.sh"
  }
]
ec2_sg_name = "Terraform-EC2-SG"
volume_size = 20
region      = "us-east-1"