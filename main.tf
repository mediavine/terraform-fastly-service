resource "fastly_service_vcl" "this" {
  name = var.fastly_service_name

  activate      = var.fastly_activate
  force_destroy = var.fastly_force_destroy

  domain {
    name    = var.fastly_domain_name
    comment = var.fastly_domain_comment
  }

  dynamic "backend" {
    for_each = var.fastly_backends
    content {
      name                  = backend.value.name
      address               = backend.value.address
      port                  = backend.value.port
      auto_loadbalance      = backend.value.auto_loadbalance
      between_bytes_timeout = backend.value.between_bytes_timeout
      connect_timeout       = backend.value.connect_timeout
      error_threshold       = backend.value.error_threshold
      first_byte_timeout    = backend.value.first_byte_timeout
      max_conn              = backend.value.max_conn
      ssl_check_cert        = backend.value.ssl_check_cert
      use_ssl               = backend.value.use_ssl
      weight                = backend.value.weight
    }

  }
}