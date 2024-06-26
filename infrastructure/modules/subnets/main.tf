resource "aws_subnet" "skr_public_subnet_1" {
    vpc_id = var.vpc_id
    cidr_block = var.public_subnet_1
    availability_zone = var.az_1



    tags = {
      Name = "shashank_public_subnet"
    }
}

