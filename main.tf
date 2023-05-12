resource "aws_subnet" "main" {
  count              = length(var.cidr_block)
  cidr_block         = var.cidr_block[count.index]
  availability_zone  = var.availability_zone[count.index]
  vpc_id             = var.vpc_id

  tags = merge(
    local.common_tags,
    { Name = "${var.env}-${var.name}-subnet-${count.index + 1}" }
  )
}


resource "aws_route_table" "example" {
  vpc_id = var.vpc_id

#  route {
#    cidr_block = "10.0.1.0/24"
#    gateway_id = aws_internet_gateway.example.id
#  }
#
#  route {
#    ipv6_cidr_block        = "::/0"
#    egress_only_gateway_id = aws_egress_only_internet_gateway.example.id
#  }

  tags = merge(
    local.common_tags,
    { Name = "${var.env}-${var.name}-route_table" }
  )
}
