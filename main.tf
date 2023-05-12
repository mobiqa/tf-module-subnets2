module "subnets" {
  source                    = "./subnets"
  availability_zone         = var.availability_zone
  cidr_block                = var.cidr_block
  default_vpc_id            = var.default_vpc_id
  env                       = var.env
  name                      = var.name
  vpc_id                    = var.vpc_id
  vpc_peering_connection_id = var.vpc_peering_connection_id
}

//resource "aws_route" "internet_gw_route" {
//  count                  = var.internet_gw ? 1 : 0
//  route_table_id         = aws_route_table.route_table.id
//  destination_cidr_block = "0.0.0.0/0"
//  gateway_id             = var.internet_gw_id
//}
//
//resource "aws_internet_gateway" "igw" {
//  count                  = var.internet_gw ? 1 : 0
//  vpc_id = var.vpc_id
//
//  tags = merge(
//    local.common_tags,
//    { Name = "${var.env}-igw" }
//  )
//}
//
//resource "aws_eip" "ngw-eip" {
//  vpc = true
//}
//
//resource "aws_nat_gateway" "ngw" {
//  count                  = var.nat_gw ? 1 : 0
//  allocation_id = aws_eip.ngw-eip.id
//  subnet_id     = var.public_subnet_ids[0]
//
//  tags = merge(
//    local.common_tags,
//    { Name = "${var.env}-ngw" }
//  )
//
//}
//