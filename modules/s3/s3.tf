# ----------------------------------------------------------------------------------------------------------------------
# Create S3 Bucket, and create re-write rule
# ----------------------------------------------------------------------------------------------------------------------
resource "aws_s3_bucket" "backend" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
  }
}

# Configure static file hosting
resource "aws_s3_bucket_website_configuration" "public" {
  bucket = aws_s3_bucket.backend.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  routing_rule {
    condition {
      key_prefix_equals = "docs/"
    }
    redirect {
      replace_key_prefix_with = "documents/"
    }
  }

  depends_on = [ aws_s3_bucket.backend ]
}

resource "aws_s3_bucket_public_access_block" "backend-public" {
  bucket = aws_s3_bucket.backend.bucket

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "s3_demo_bucket" {
    bucket = aws_s3_bucket.backend.id

    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Sid = "PublicReadGetObject"
                Effect = "Allow"
                Principal = "*"
                Action = "s3:GetObject"
                Resource = [
                    aws_s3_bucket.backend.arn,
                    "${aws_s3_bucket.backend.arn}/*",
                ]
            },
        ]
    })

}