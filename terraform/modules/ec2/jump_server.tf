data "aws_ami" "ubuntu_2204" {
  most_recent      = true
  name_regex       = "^ubuntu-2204"

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

resource "aws_instance" "jump_server" {
  ami           = data.aws_ami.ubuntu_2204.id
  instance_type = "t3.micro"
  subnet_id = var.bastian_subnet_id
  key_name = aws_key_pair.jump_server_key.id
  vpc_security_group_ids = [var.allow_ssh_security_group_id]

  tags = {
    Name = "jump_server"
  }
}

resource "aws_eip" "jump_server" {
  instance = aws_instance.jump_server.id
}

resource "aws_key_pair" "jump_server_key" {
  key_name   = "jump-server-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCx++8/r8L5JMwqghQa5QR2h9PWdcbO0bRi1WvJzsKYGojTzxPGGqQTiibw+vq0600fJd23dhPhcNGI1+9oLGVgVMYjKB8W+3/SOpmTPt/IKyBLG3TwsXW98dvUAjJDs+zpWUfbeIFTWK2fCcxPcgjo9p5ufcSN6Kne3u7/pr8cpcwM1Tl17UsSqhPe/Pkt6FVAK+z9kcX0wewMELbo+7lcutHPmmdqiBvocHDj7h/E2QynHtHA5DvnWRaxVtuXw5jZVcH+QrbtgKgW5fro0eZvcdOaZ3e4u+B8EYQAXNZVm9qmIDTfwQ32uqSNLmiZuFaITou0f1trU6HYe1N0PLHEmqc4ss/L0bD7VpWHjgCh2q7QpGnoyKS3aJDRfDhegxhAQ5W9prZD4cnO8Cz/+5YQ3Vb0uG2qImF4bEywuyXMiwKZuXpvm3wenI0odU35GCkqTYKAj66TkYU3fDwtYi/I7db/VnIqTN6bIUGFH+5r5BRaTgtQa6Jb5Vg2Zaczz5k= amith@test"
}