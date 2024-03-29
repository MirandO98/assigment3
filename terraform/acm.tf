data "aws_route53_zone" "appstellar-training" {
  name = "appstellar.training"
}

module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 4.0"

  domain_name  = data.aws_route53_zone.appstellar-training.name
  zone_id      = data.aws_route53_zone.appstellar-training.zone_id

  validation_method = "DNS"

  subject_alternative_names = [
    "mirand-assignment3.appstellar.training"
  
  ]

  wait_for_validation = true

  tags = {
    Name = "mirand-assignment3.appstellar.training"
  }
}