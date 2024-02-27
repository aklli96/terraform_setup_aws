resource "aws_iam_user" "user_list" {
    count = "${length(var.usernames)}"
    name = "${element(var.usernames,count.index)}"
}

resource "aws_iam_access_key" "my_access_key" {
  count = "${length(var.usernames)}"
  user = "${element(var.usernames,count.index)}"
  pgp_key = var.pgp_key
  depends_on = [aws_iam_user.user_list]
}

resource "aws_iam_group" "dev_group" {
  name = "Developer"
}

resource "aws_iam_user_group_membership" "user_group_membership" {
  count = length(var.usernames)
  user   = element(var.usernames, count.index)
  groups = [aws_iam_group.dev_group.name, ]
}
