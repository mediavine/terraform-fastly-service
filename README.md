# Terraform Fastly Service Module

This module handles the creation and configuration of services in Fastly.

## Features

This module allows for the creation of multiple backends with customizable parameters such as:

- Name
- Address
- Port
- Auto Loadbalance
- Between Bytes Timeout
- Connect Timeout
- Error Threshold
- First Byte Timeout
- Max Conn
- SSL Check Cert
- Use SSL
- Weight

## Usage

```terraform
module "fastly_service" {
  source = "path/to/module"
  fastly_api_key = "your_fastly_api_key"
  fastly_backends = [
    {
      name    = "backend1"
      address = "1.2.3.4"
      port    = 80
      // other parameters...
    },
    {
      name    = "backend2"
      address = "5.6.7.8"
      port    = 80
      // other parameters...
    }
  ]
}