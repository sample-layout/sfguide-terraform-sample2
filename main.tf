terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.59"
    }
  }
}

provider "snowflake" {
  username="tf-snow"
  private_key_path ="~/.ssh/snowflake_tf_snow_key.p8"
  account = "ehb49065"
  region = "prod3.us-west-2.aws"
  role  = "SYSADMIN"
}

resource "snowflake_database" "db" {
  name     = "TF_DEMO2"
}

resource "snowflake_warehouse" "warehouse" {
  name           = "TF_DEMO2"
  warehouse_size = "xsmall"

  auto_suspend = 60
}
