variable "instances" {
  type = map(object({
    ami                = string
    instance_type      = string
    subnet_id          = string
    enable_encryption  = bool
  }))
}

variable "common_tags" {
  type = map(string)
}
