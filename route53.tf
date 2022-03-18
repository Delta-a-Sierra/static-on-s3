resource "aws_route53_zone" "main_domain" {
  name = var.domain_name
}


resource "aws_route53_record" "a_record" {
    zone_id = aws_route53_zone.main_domain.zone_id
    name  = "${var.a_record_name}.${var.domain_name}"
    type  = "A"

    alias {
        name = aws_cloudfront_distribution.s3_distribution.domain_name
        zone_id = aws_cloudfront_distribution.s3_distribution.hosted_zone_id
        evaluate_target_health = false
    }

}

output "name_servers" {
  value = aws_route53_zone.main_domain.name_servers
}