terraform {
  required_version = ">= 0.12"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version =  "~> 5.0"
  }
  
}
}
provider "aws" {
    region = "us-east-1"
    access_key = "ASIAWGYVRRBBNOHM6WVO"
    secret_key = "Zg3kSPtQKdb0HfFbj9elR1tC+eqcEi8i9iJaSg/0"
    default_tags {
   tags = {
   
    silo = "Intern-2"
    owner = "shashank.ray"
    environment = "dev"
    terraform = "true"
 }
}
}
