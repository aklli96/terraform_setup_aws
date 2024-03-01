output "vpc_id" {
    value = aws_vpc.anthony_vpc.id
}
output "private_subnet_ids"{

    value = aws_subnet.anthony_private_subnet.*.id
    #value = aws_subnet.anthony_private_subnet[count.index]
}

output "public_subnet_ids"{
    value = aws_subnet.anthony_public_subnet[0].id
}