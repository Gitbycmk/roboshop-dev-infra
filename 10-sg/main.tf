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

# # Frontend Accepting Traffic From Frontend ALB
# resource "aws_security_group_rule" "forntend_frontend_alb" {
#   type                     = "ingress"
#   security_group_id        = module.sg[9].sg_id # Frontend SG ID
#   source_security_group_id = module.sg[11].sg_id # Frontend ALB SG ID
#   from_port                = 80
#   protocol                 = "tcp"
#   to_port                  = 80
# }