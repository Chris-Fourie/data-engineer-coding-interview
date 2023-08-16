###################
# Glue Connection #
###################
resource "aws_glue_connection" "terraflow_aurora_postgresql" {
  name = "terraflow_aurora_postgresql"
  connection_type = "JDBC"
  connection_properties = {
    database_name = "terraflow_glue_connection_db"
    jdbc_driver_class = "org.postgresql.Driver"
    jdbc_url = "mycluster.cluster-123456789012.us-east-1.rds.amazonaws.com"
    username = "postgres"
    password = "5Y67bg#r#"
  }
}

##################
# Glue Catalog   #
##################
resource "aws_glue_catalog_database" "terraflow_glue_catalog_db" {
  name = "terraflow_glue_catalog_db"
}

resource "aws_glue_catalog_table" "my_table" {
  database_name = aws_glue_catalog_database.terraflow_glue_catalog_db.name
  name = "terraflow_glue_catalog_table"
  table_type = "EXTERNAL_TABLE"
  storage_format = "PARQUET"
  location = "s3://my-bucket/terraflow-glue-catalog-table.parquet"
}

##################
# Glue Crawler   #
##################
resource "aws_glue_crawler" "terraflow_aurora_postgresql_crawler" {
  name = "terraflow_aurora_postgresql_crawler"
  connection_name = aws_glue_connection.terraflow_aurora_postgresql.name
  database_name = "terraflow_glue_catalog_db"
}


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