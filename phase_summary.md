Hybrid Cloud Deployment (AWS + Azure)

This project connects two separate cloud environments—AWS and Azure—into a single hybrid network using a site-to-site VPN with static routing.

Objective:  
Enable secure, private communication between virtual machines hosted in separate cloud providers by building infrastructure in Terraform and configuring networking components manually where needed.

What Was Done:

- Provisioned Infrastructure (Terraform):
  - Created a Virtual Private Cloud (VPC) in AWS and a Virtual Network (VNet) in Azure.
  - Deployed a Virtual Private Gateway in AWS and a Virtual Network Gateway in Azure.
  - Configured the appropriate subnets: VMSubnet for hosting VMs and GatewaySubnet for VPN integration.
  - Generated Terraform files for automating AWS and Azure resource creation.

- VPN Setup:
  - Created a Customer Gateway in AWS and two Local Network Gateways in Azure.
  - Established a VPN Connection with two tunnels from AWS to Azure.
  - Switched from BGP to static routing due to persistent peering issues.

- Routing Configuration:
  - Added tunnel CIDRs and VNet/VPC address spaces to the Azure Local Network Gateways.
  - Configured route tables in both cloud providers to direct traffic through the VPN gateways.
  - Attached route tables to the correct subnets to ensure packets flow between VMs.

- Deployed and Connected VMs:
  - Launched an EC2 instance in AWS (Ubuntu-based, public subnet).
  - Created a virtual machine in Azure (Ubuntu), configured for SSH access.
  - Confirmed private IP addresses were reachable between clouds by pinging across the tunnel.

Troubleshooting & Decision Making:

- Initially attempted to configure BGP but ran into a persistent “Connecting” status despite correct ASN, CIDRs, PSKs, and security rules.
- After isolating the issue and verifying all IPsec settings were valid, opted to rebuild the VPN with static routing, which immediately brought the tunnels up.
- Implemented Network ACL rules, Security Groups, and NSGs to allow traffic over TCP 179 (BGP) and ICMP before switching off BGP.
- Added Terraform `.gitignore` entries and cleaned up large files to push the repository to GitHub without exceeding file size limits.

Why This Matters:

This was a full end-to-end cloud networking project that involved:

- Using infrastructure-as-code (Terraform) across two different cloud providers.
- Dealing with real-world hybrid network configuration challenges.
- Hands-on troubleshooting of tunnel and routing issues.
- Practicing cloud resource provisioning, VPN/IPsec setup, and route table design.

All resources were documented and uploaded to GitHub, along with screenshots and configuration exports.
