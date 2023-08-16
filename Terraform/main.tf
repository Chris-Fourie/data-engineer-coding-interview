##################
# Glue Catalog   #
##################

##################
# Glue Crawler   #
##################

##################
# Glue Job       #
##################

##################
# s3 Bucket      #
##################
resource "aws_s3_bucket" "terraflow-interview-data" {
  bucket = "terraflow-interview-data"
  acl = "private"
  versioning {
    enabled = true
  }
}