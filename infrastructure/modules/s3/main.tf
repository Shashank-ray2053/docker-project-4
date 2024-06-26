resource "aws_s3_bucket" "shashank-artifacts-s3-bucket" {
  bucket = "intern-2-s3-bucket"
  force_destroy = true

  tags = {
    Name        = "Intern-2-shashank-artifacts-bucket"
    
  }
}

resource "aws_s3_bucket_ownership_controls" "shashank-intern-2-s3-bucket-ownership" {
  bucket = aws_s3_bucket.shashank-artifacts-s3-bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "shashank-s3-bucket-public-access" {
  bucket = aws_s3_bucket.shashank-artifacts-s3-bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_acl" "shashank-intern-2-s3-acl" {
  depends_on = [ 
    aws_s3_bucket_ownership_controls.shashank-intern-2-s3-bucket-ownership,
    aws_s3_bucket_public_access_block.shashank-s3-bucket-public-access,
    ]

  bucket = aws_s3_bucket.shashank-artifacts-s3-bucket.id
  acl = "private"
}

resource "aws_s3_bucket_versioning" "shashank_versioning" {
  bucket = aws_s3_bucket.shashank-artifacts-s3-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}



