terraform {
  required_providers {
    fastly = {
      source  = "fastly/fastly"
      version = ">= 5.6.0"
    }
  }
}

provider "fastly" {
  api_key = sensitive(var.fastly_api_key)
}
