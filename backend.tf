terraform {
    backend "s3" {
        bucket         = "staticwebsiteenestos"
        key            = "us-east-2-tfstate-rds"
        region         = "us-east-2"
        #dynamodb_table = "us-east-2-dynamodb-tfstate"
    }
}