module "vpc" {
  source        = "git::https://github.com/sivaganga9786/Terraform-foundation.git//terraform-modules/vpc"
  vpc_cidr            = var.vpc_cidr
  private_subnet_cidrs = var.private_subnet_cidrs
  public_subnet_cidrs = var.public_subnet_cidrs
  cluster_name        = var.vpc_name
  availability_zones   = var.availability_zones
}

module "ec2" {
  source        = "git::https://github.com/sivaganga9786/Terraform-foundation.git//terraform-modules/ec2"
  instances      = var.instances
  subnet_id = module.vpc.public_subnets[0]
  key_name       = var.key_name
  ec2_sg_name    = var.ec2_sg_name
  volume_size   = var.volume_size
  vpc_id     = module.vpc.vpc_id
  user_data      = [
    # file("${path.module}/jenkins.sh"),
    file("${path.module}/build.sh"),
    # file("${path.module}/sonarqube.sh"),
    # file("${path.module}/minikube.sh")
    #file("${path.module}/ansible.sh")
  ]
}