module "fastly_demo" {
  source                         = "../.."
  fastly_api_key                 = "yourkeyhere"
  fastly_force_destroy           = true
  fastly_service_name            = "example-service"
  fastly_domain_name             = "www.example.com"
  fastly_domain_comment          = "This is an example domain"
  fastly_enable_header           = true
  fastly_enable_request_settings = true
  fastly_backends = [
    {
      name                  = "example-backend"
      address               = "fides.mediavine.com"
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