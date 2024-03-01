#Create DB sg group
resource "aws_security_group" "anthony_db_sg"{
    name = "Anthony_db_sg"
    description = "Security group for Anthony database"

    vpc_id = var.vpc_id

    ingress{
        description = "allow mysql traffic from only the ec2 sg"
        from_port = "3306"
        to_port = "3306"
        protocol = "tcp"
        security_groups = [var.ec2_sg_id]
    }
    tags = {
        Name = "Anthony_db_sg"
    }
}

#Create DB subnet group
resource "aws_db_subnet_group" "Anthony_db_subnet_group"{
    name = "anthony_db_subnet_group"
    description = "Db subnet group for tutorial"

    subnet_ids = [for subnet_id in var.private_subnet_ids : subnet_id]
}

#Create MySQL DB
resource "aws_db_instance" "Anthony_database"{
    allocated_storage = var.settings.database.allocated_storage
    engine = var.settings.database.engine
    engine_version = var.settings.database.engine_version
    instance_class = var.settings.database.instance_class
    db_name = var.settings.database.db_name
    username = var.db_username
    password = var.db_password
    db_subnet_group_name = aws_db_subnet_group.Anthony_db_subnet_group.id
    vpc_security_group_ids = [aws_security_group.anthony_db_sg.id]
    skip_final_snapshot = var.settings.database.skip_final_snapshot
}
