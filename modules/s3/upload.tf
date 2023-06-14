# ----------------------------------------------------------------------------------------------------------------------
# Upload files and folder to S3
# ----------------------------------------------------------------------------------------------------------------------
resource "aws_s3_bucket_object" "objects" {
    content_type = "text/html"
    
    for_each = fileset("${path.module}/upload/", "**")
    bucket = aws_s3_bucket.backend.id
    key = each.value
    source = "${path.module}/upload/${each.value}"
    etag = filemd5("${path.module}/upload/${each.value}")

    depends_on = [ aws_s3_bucket.backend ]
}