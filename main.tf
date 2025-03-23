# Create AWS VPC
resource "aws_vpc" "aws_vpc" {
  cidr_block           = "10.10.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "AWS-VPC"
  }
}

# Create AWS Subnet
resource "aws_subnet" "aws_subnet" {
  vpc_id                  = aws_vpc.aws_vpc.id
  cidr_block              = "10.10.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "AWS-Subnet"
  }
}

# Create AWS VPN Gateway
resource "aws_vpn_gateway" "aws_vgw" {
  vpc_id = aws_vpc.aws_vpc.id

  tags = {
    Name = "AWS-VPN-Gateway"
  }
}
# Create Azure Virtual Network
resource "azurerm_virtual_network" "azure_vnet" {
  name                = "Azure-VNet"
  location            = "East US"
  resource_group_name = "HybridCloudRG"
  address_space       = ["10.20.0.0/16"]

  tags = {
    environment = "Production"
  }
}

# Create Azure Subnet
resource "azurerm_subnet" "gateway_subnet" {
  name                 = "GatewaySubnet"
  resource_group_name  = "HybridCloudRG"
  virtual_network_name = azurerm_virtual_network.azure_vnet.name
  address_prefixes     = ["10.20.1.0/24"]
}
# Create Azure Public IP for VPN Gateway
resource "azurerm_public_ip" "azure_vpn_ip" {
  name                = "Azure-VPN-IP"
  location            = "East US"
  resource_group_name = "HybridCloudRG"
  allocation_method   = "Static"
  sku                = "Standard"
}

# Create Azure VPN Gateway
resource "azurerm_virtual_network_gateway" "azure_vpn_gateway" {
  name                = "Azure-VPN-Gateway"
  location            = "East US"
  resource_group_name = "HybridCloudRG"
  type                = "Vpn"
  vpn_type            = "RouteBased"

  sku = "VpnGw2"

  ip_configuration {
    name                          = "vpnGatewayIpConfig"
    public_ip_address_id          = azurerm_public_ip.azure_vpn_ip.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.gateway_subnet.id
  }
}

