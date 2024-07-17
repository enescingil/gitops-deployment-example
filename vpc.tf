# Create the VPC
resource "aws_vpc" "my_vpc" {
    cidr_block = "10.0.0.0/16"  # Replace with your desired CIDR block
    tags = {
        Name = "my-vpc"
    }
}

# Create the public subnet
resource "aws_subnet" "public_subnet" {
    vpc_id                  = aws_vpc.my_vpc.id
    cidr_block              = "10.0.1.0/24"  # Replace with your desired CIDR block
    availability_zone       = "us-east-2a"  # Replace with your desired availability zone
    map_public_ip_on_launch = true

    tags = {
        Name = "public-subnet"
    }
}

# Create the private subnet
resource "aws_subnet" "private_subnet" {
    vpc_id                  = aws_vpc.my_vpc.id
    cidr_block              = "10.0.2.0/24"  # Replace with your desired CIDR block
    availability_zone       = "us-east-2b"  # Replace with your desired availability zone
    map_public_ip_on_launch = false

    tags = {
        Name = "private-subnet"
    }
}