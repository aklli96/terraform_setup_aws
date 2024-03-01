#Create vpc
resource "aws_vpc" "anthony_vpc"{
    cidr_block = var.vpc_cide_block
    enable_dns_hostnames = true

    tags = {
        Name = "dev_vpc"
    }
}


#Create internet gateway
resource "aws_internet_gateway" "anthony_igw"{

    vpc_id = aws_vpc.anthony_vpc.id
    tags = {
        Name = "dev_igw"
    }

}

#Set up Public subnet
resource "aws_subnet" "anthony_public_subnet" {
    count = var.subnet_count.public

    vpc_id = aws_vpc.anthony_vpc.id

    cidr_block = var.public_subnet_cidr_blocks[count.index]

    availability_zone = data.aws_availability_zones.available.names[count.index]

    tags = {
        Name = "dev_public_subnet_${count.index}"
    }
}

#Set up Private subnet
resource "aws_subnet" "anthony_private_subnet" {
    count = var.subnet_count.private

    vpc_id = aws_vpc.anthony_vpc.id

    cidr_block = var.private_subnet_cidr_blocks[count.index]

    availability_zone = data.aws_availability_zones.available.names[count.index]

    tags = {
        Name = "dev_private_subnet_${count.index}"
    }
}

#Create pbulic & private route table
resource "aws_route_table" "anthony_public_rt"{
    vpc_id = aws_vpc.anthony_vpc.id

    route{
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.anthony_igw.id
    }
}

resource "aws_route_table_association" "public"{
    count = var.subnet_count.public
    route_table_id = aws_route_table.anthony_public_rt.id
    subnet_id = aws_subnet.anthony_public_subnet[count.index].id
}

resource "aws_route_table" "anthony_private_rt"{
    vpc_id = aws_vpc.anthony_vpc.id
}

resource "aws_route_table_association" "private"{
    count = var.subnet_count.private
    route_table_id = aws_route_table.anthony_private_rt.id
    subnet_id = aws_subnet.anthony_private_subnet[count.index].id
}
