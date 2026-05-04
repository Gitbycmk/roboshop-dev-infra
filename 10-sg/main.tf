## Using Open Source Module
# module "vote_service_sg" {
#   source = "terraform-aws-modules/security-group/aws"

#   name        = "${local.common_name_suffix}-catalogue"
#   use_name_prefix = false
#   description = "Security group for catalogue service with custom ports open within VPC, egress all ports"
#   vpc_id      = data.aws_ssm_parameter.vpc_id.value

# }



module "sg" {
  count = length(var.sg_names)
  source = "git::https://github.com/Gitbycmk/terraform-aws-sg.git?ref=main"
  project_name = var.project_name
  environment = var.environment
  sg_name = var.sg_names[count.index]
  sg_description = "Created for ${var.sg_names[count.index]}"
  vpc_id =  local.vpc_id
}
