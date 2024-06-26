resource "aws_route_table_association" "intern_2_public_rta" {
     subnet_id      = var.public_subnet_1
     route_table_id = var.intern_2_devops_public_route_table
  
 }
