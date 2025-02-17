
resource "random_id" "bucket_suffix" {
  byte_length = 8
}

# backend.tf
terraform {
  backend "s3" {
    bucket         = "testbucket240612932137"  # Use your existing S3 bucket name
    key            = "terraform/state/terraform.tfstate"  # State file path inside the bucket
    region         = "us-east-1"  # Your AWS region
    dynamodb_table = "terraform-locks"  # Optional, used to lock state (ensure it exists in the same region)
    encrypt        = true  # Enable encryption for the state file
  }
}

