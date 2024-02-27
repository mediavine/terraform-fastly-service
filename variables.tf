variable "fastly_service_name" {
  description = "The name of the Fastly service"
  type        = string
}

variable "fastly_activate" {
  description = "Conditionally prevents the Service from being activated. The apply step will continue to create a new draft version but will not activate it if this is set to false"
  type        = bool
  default     = true
}

variable "fastly_force_destroy" {
  description = "When destroying a service, the force_destroy option must be set to true in order to destroy the service"
  type        = bool
  default     = false
}

variable "fastly_domain_name" {
  description = "The name of the domain to be added to the Fastly service"
  type        = string
}

variable "fastly_domain_comment" {
  description = "A comment to be added to the domain"
  type        = string
  default     = ""
}

variable "fastly_backends" {
  description = "A list of backends to be added to the Fastly service"
  type = list(object({
    name                  = string
    address               = string
    port                  = number
    auto_loadbalance      = bool
    between_bytes_timeout = number
    connect_timeout       = number
    error_threshold       = number
    first_byte_timeout    = number
    max_conn              = number
    ssl_check_cert        = bool
    use_ssl               = bool
    weight                = number
  }))
  default = [
    {
      name                  = "example-backend"
      address               = "example.com"
      port                  = 80
      auto_loadbalance      = false
      between_bytes_timeout = 10000
      connect_timeout       = 1000
      error_threshold       = 0
      first_byte_timeout    = 15000
      max_conn              = 200
      ssl_check_cert        = true
      use_ssl               = false
      weight                = 100
    }
  ]
}

variable "fastly_api_key" {
  description = "The Fastly API key"
  type        = string
}
