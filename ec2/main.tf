resource "aws_instance" "this" {
  for_each = var.instances

  ami           = each.value.ami
  instance_type = each.value.instance_type
  subnet_id     = each.value.subnet_id

  dynamic "root_block_device" {
    for_each = each.value.enable_encryption ? [1] : []
    content {
      encrypted = true
      volume_size = 20
    }
  }

  tags = merge(
    {
      Name = each.key
    },
    var.common_tags
  )
}
