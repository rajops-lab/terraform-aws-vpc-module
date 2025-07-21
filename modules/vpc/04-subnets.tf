# Resource Block for public subnet
resource "aws_subnet" "eks_public_subnets" {

  count                   = length(var.public_subnets) # Creates one subnet per CIDR block in public_subnet list
  vpc_id                  = aws_vpc.eks-vpc.id
  cidr_block              = element(var.public_subnets, count.index) # Assign each subnet a CIDR block from the list  
  availability_zone       = element(var.public_azs, count.index)     # Assign corresponding AZ to each subnet
  map_public_ip_on_launch = true                                     # Automatically assign public IP to instances launched in this subnet   

  tags = {
    Name = "${var.environment}-public-subnet-${element(var.public_azs, count.index)}"
  }
}

# Resource Block for Private subnet
resource "aws_subnet" "eks_private_subnets" {

  count             = length(var.private_subnets) # Creates one subnet per CIDR block in private_subnet list
  vpc_id            = aws_vpc.eks-vpc.id
  cidr_block        = element(var.private_subnets, count.index) # Assign each subnet a CIDR block from the list  
  availability_zone = element(var.private_azs, count.index)     # Assign corresponding AZ to each subnet
  #  map_public_ip_on_launch = true   # i dont want my private subnet should be enable

  tags = {
    Name = "${var.environment}-private-subnet-${element(var.private_azs, count.index)}"
  }
}