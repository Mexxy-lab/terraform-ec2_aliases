# The default provider configuration; resources that begin with `aws_` will use
# it as the default, and it can be referenced as `aws`.
provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "default_instance" {
  count         = 3
  ami           = "ami-06d4b7182ac3480fa"  # Replace with your desired AMI ID. eu-central-1
  instance_type = "t2.micro"  # Replace with your desired instance type
  tags = {
    Name = "pumejdefaultInstance"
  }
}

# Additional provider configuration for west coast region; resources can
# reference this as `aws.west`.
provider "aws" {
  alias  = "west"
  region = "us-west-2"
}

# Adding resources to be provisioned or created

resource "aws_instance" "west_instance" {
  count         = 2
  provider      = aws.west
  ami           = "ami-093467ec28ae4fe03"  # Replace with your desired AMI ID. us-west-2
  instance_type = "t2.micro"  # Replace with your desired instance type

  tags = {
    Name = "pumejwestInstance"
  }
}

provider "aws" {
  alias  = "south"
  region = "ap-south-1"
}

resource "aws_instance" "south_instance" {
  count         = 2
  provider      = aws.south
  ami           = "ami-02a2af70a66af6dfb"  # Replace with your desired AMI ID. ap-south-1
  instance_type = "t2.micro"  # Replace with your desired instance type

  tags = {
    Name = "pumejsouthInstance"
  }
}

provider "aws" {
  alias  = "central"
  region = "eu-central-1"
}

resource "aws_instance" "central_instance" {
  count         = 3
  provider      = aws.central
  ami           = "ami-0669b163befffbdfc"  # Replace with your desired AMI ID. eu-central-1
  instance_type = "t2.micro"  # Replace with your desired instance type

  tags = {
    Name = "pumejcentralInstance"
  }
}