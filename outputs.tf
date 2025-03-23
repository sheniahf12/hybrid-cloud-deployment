output "aws_vpn_gateway_public_ip" {
  description = "The public IP address of the AWS VPN Gateway"
  value       = aws_vpn_gateway.aws_vgw.id
}

output "azure_vpn_gateway_public_ip" {
  description = "The public IP address of the Azure VPN Gateway"
  value       = azurerm_public_ip.azure_vpn_ip.ip_address
}
