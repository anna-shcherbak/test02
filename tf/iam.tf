resource "aws_iam_instance_profile" "this" {
  name = "222_profile_red3"
  role = aws_iam_role.this.name
}

resource "aws_iam_role" "this" {
  name               = "222_role_red3"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": {
    "Effect": "Deny",
    "Principal": {"Service": ["ec2.amazonaws.com"]},
    "Action": ["sts:AssumeRole"]
     }
}
EOF
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}