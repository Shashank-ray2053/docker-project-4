resource "aws_security_group" "shashank_sg" {
    name = "shashank_sg"
    description = "allow inbound and outbound traffic"
    vpc_id = var.vpc_id.id

    tags = {
      Name = "Shashank_sg"
    }

    ingress {
        description = "ssh port opening"
        cidr_blocks =[var.all_traffic]
        from_port = 22
        protocol = "tcp"
        to_port = 22
    }

    ingress{
        description = "http port opening"
        cidr_blocks =[var.all_traffic]
        from_port = 80
        protocol = "tcp"
        to_port = 80
    }
}

