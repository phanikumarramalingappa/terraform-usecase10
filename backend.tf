terraform {
  backend "s3" {
    bucket       = "terraform-usecases-nsh-batch-6"
    key          = "usecaseten/terraform.tfstate"
    region       = "us-east-1"
    #use_lockfile = true
  }
}
