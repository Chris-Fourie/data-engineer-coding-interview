## Terraform ## 
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  backend "s3" {
    bucket = "teraflow-terraform-state"
    region = "us-east-1"
    key = "terraform.tfstate"
  }
}

### AWS ###

provider "aws" {
  region = "us-east-1"
}

###################
# Glue Connection #
###################
# resource "aws_glue_connection" "teraflow_aurora_postgresql" {
#   name = "teraflow_aurora_postgresql"
#   connection_type = "JDBC"
#   connection_properties = {
#     # JDBC_DRIVER_CLASS = "org.postgresql.Driver"
#     JDBC_CONNECTION_URL = "mycluster.cluster-123456789012.us-east-1.rds.amazonaws.com"
#     USERNAME = "postgres"
#     PASSWORD = "5Y67bg#r#"
#   }
# }

# ##################
# # Glue Catalog   #
# ##################
# resource "aws_glue_catalog_database" "teraflow_glue_catalog_db" {
#   name = "teraflow_glue_catalog_db"
# }

# resource "aws_glue_catalog_table" "my_table" {
#   database_name = aws_glue_catalog_database.teraflow_glue_catalog_db.name
#   name = "teraflow_glue_catalog_table"
#   table_type = "EXTERNAL_TABLE"
#   storage_format = "PARQUET"
#   location = "s3://my-bucket/teraflow-glue-catalog-table.parquet"
# }

# ##################
# # Glue Crawler   #
# ##################
# resource "aws_glue_crawler" "teraflow_aurora_postgresql_crawler" {
#   name = "teraflow_aurora_postgresql_crawler"
#   connection_name = aws_glue_connection.teraflow_aurora_postgresql.name
#   database_name = "teraflow_glue_catalog_db"
# }


##################
# Glue Job       #
##################

##################
# s3 Buckets     #
##################
resource "aws_s3_bucket" "teraflow-interview-data" {
  bucket = "teraflow-interview-data"
  acl = "private"
  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket" "teraflow-terraform-state" {
  bucket = "teraflow-terraform-state"
  acl = "private"
  versioning {
    enabled = true
  }
}