variable "enable_nat" { type = bool; default = false }
variable "public_subnets" { type = list(string) }

resource "aws_eip" "nat" {
  count = var.enable_nat ? length(var.public_subnets) : 0
  vpc   = true
}

resource "aws_nat_gateway" "nat" {
  count         = var.enable_nat ? length(var.public_subnets) : 0
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = var.public_subnets[count.index]
}
