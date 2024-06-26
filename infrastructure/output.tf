output "vpc_id" {
    value = module.vpc.vpc_id
  
}

output "intern_2_devops_route_tables" {
  value = module.route_table.intern_2_devops_route_tables
}