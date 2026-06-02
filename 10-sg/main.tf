## SG Creation Using Open Source Module
# module "catalogue" {
#   source = "terraform-aws-modules/security-group/aws"

#   name = "${local.common_name_suffix}-catalogue"
#   description = "Security group for catalogue with custom ports open within VPC, egress all traffic"
#   vpc_id = data.aws_ssm_parameter.vpc_id.value
#   use_name_prefix = false

# }

module "sg" {
    count = length(var.sg_names)
  source = "git::https://github.com/Gitbycmk/terraform-aws-sg.git?ref=main"
  project_name = var.project_name
  environment = var.environment
  sg_name = var.sg_names[count.index]
  sg_description = "created for ${var.sg_names[count.index]}"
  vpc_id = local.vpc_id
}