## Source
source "amazon-ebs" "example" {
  region               = var.region
  ami_name             = "${var.ami_name}_{{timestamp}}"
  instance_type        = var.instance_type
  iam_instance_profile = var.iam_instance_profile
  ssh_username         = var.ssh_username

  source_ami_filter {
    owners      = ["self"]
    most_recent = true

    filters {
      virtualization-type = "hvm"
      name                = "${var.ami_name}*"
      root-device-type    = "ebs"
    }
  }

  tags {
    Name = "${var.ami_name}_{{timestamp}}"
  }
}