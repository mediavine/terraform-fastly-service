module "fastly_demo" {
  source                         = "../.."
  fastly_api_key                 = "yourkeyhere"
  fastly_force_destroy           = true
  fastly_service_name            = "example-service"
  fastly_domain_name             = "www.fastly-test.mediavine.com"
  fastly_domain_comment          = "This is an example domain"
  fastly_enable_header           = true
  fastly_enable_request_settings = true
  fastly_backends = [
    {
      name                  = "example-backend"
      address               = "fides.mediavine.com"
      weight = 50
    },
    {
      name                  = "example-backend-2"
      address               = "fides.mediavine.com"
      weight = 50
    }
  ]
}