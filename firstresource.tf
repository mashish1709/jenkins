terraform {
  backend "s3" {
    bucket = "my-prod-terra-tfstate-bucket"
    region = "us-east-1"
    key="terraform.tfstate"
    dynamodb_table = "my-testingtfstate-table"
  }
}

resource "aws_instance" "web" {
  ami           = "ami-09d3b3274b6c5d4aa"
  instance_type = "t2.micro"

  tags = {
    Name = "Testresource1"
  }
}
