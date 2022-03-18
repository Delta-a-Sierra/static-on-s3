

resource "aws_s3_bucket" "s3b" {
  bucket = var.bucket_name

  tags = {
    Name = var.bucket_name
    project = var.project_name
  }
}


resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.s3b.bucket
  acl    = "public-read"
}

resource "aws_s3_bucket_website_configuration" "s3WebConfig" {
  bucket = aws_s3_bucket.s3b.bucket

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_policy" "allow_access_from_cloudfront" {
  bucket = aws_s3_bucket.s3b.bucket
  policy = templatefile("bucket_policy.tftpl", {bucket_arn = aws_s3_bucket.s3b.arn, oai_id = aws_cloudfront_origin_access_identity.OAI.id})
}

resource "aws_s3_bucket_object" "object" {
  bucket = aws_s3_bucket.s3b.bucket
  key    = "index.html"
  source = "www/index.html"
  content_type = "text/html"
  etag = filemd5("www/index.html")
}