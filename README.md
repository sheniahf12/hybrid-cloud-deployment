A Hybrid Cloud Deployment: AWS + Azure Site-to-Site VPN

This project demonstrates a hybrid cloud setup between AWS and Microsoft Azure using a Site-to-Site VPN with static routing. The goal was to securely connect infrastructure between two cloud providers and validate end-to-end communication.

>> Project Goals:
- Build secure cross-cloud connectivity between AWS and Azure.
- Deploy virtual networks and VMs in both environments.
- Configure a VPN connection with static routing (no BGP).
- Verify connectivity using real Linux-based VMs.

>> Resources/Technologies Used:
- AWS EC2, VPC, VPN Gateway
- Azure Virtual Network Gateway, Local Network Gateway, Subnet Routing
- Terraform (Infrastructure as Code)
- Ubuntu and AlmaLinux
- SSH for cross-cloud testing

>> Highlights:
- Created VPN Gateway in AWS and Azure
- Configured static route-based VPN with correct IPsec tunnel CIDRs and PSKs
- Validated two-way SSH connectivity from Azure VM to AWS EC2 instance
- Documented each step thoroughly for replicability

>> Repository Contents:
- `main.tf`, `providers.tf`, `variables.tf`, `outputs.tf` = Terraform code
- `vpn-config-static.txt` = Exported AWS VPN XML config
- `README.md`= Project overview (this file)
- `phase_summary.md` = Detailed explanation of each implementation phase
- `screenshots/` = Key configuration screenshots from AWS and Azure
- `.gitignore` = Keeps sensitive files like `.terraform/` out of GitHub

>> Next Steps:
- Expand infrastructure for scalable services between AWS and Azure
- Add monitoring/logging tools
- Automate failover or HA between cloud providers

>> Author
- Sheniah Ferguson
