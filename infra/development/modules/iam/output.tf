output "secret" {
  value = {for p in aws_iam_access_key.my_access_key : p.user => p.encrypted_secret}
  sensitive = true
}

output "dev_group" {
    value = aws_iam_group.dev_group.name
}

