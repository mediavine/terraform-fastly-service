locals {
  default_header = {
    name          = var.fastly_header_name
    action        = var.fastly_header_action
    destination   = var.fastly_header_destination
    ignore_if_set = var.fastly_header_ignore_if_set
    priority      = var.fastly_header_priority
    source        = var.fastly_header_source
    type          = var.fastly_header_type
  }
}

resource "fastly_service_vcl" "this" {
  name = var.fastly_service_name

  activate       = var.fastly_activate
  force_destroy  = var.fastly_force_destroy
  stale_if_error = var.fastly_stale_if_error

  domain {
    name    = var.fastly_domain_name
    comment = var.fastly_domain_comment
  }

  dynamic "backend" {
    for_each = var.fastly_backends
    content {
      # required
      name    = backend.value.name
      address = backend.value.address

      # optional
      auto_loadbalance      = backend.value.auto_loadbalance
      between_bytes_timeout = backend.value.between_bytes_timeout
      connect_timeout       = backend.value.connect_timeout
      error_threshold       = backend.value.error_threshold
      first_byte_timeout    = backend.value.first_byte_timeout
      healthcheck           = backend.value.healthcheck
      keepalive_time        = backend.value.keepalive_time
      max_conn              = backend.value.max_conn
      max_tls_version       = backend.value.max_tls_version
      min_tls_version       = backend.value.min_tls_version
      override_host         = backend.value.override_host
      port                  = backend.value.port
      request_condition     = backend.value.request_condition
      share_key             = backend.value.share_key
      shield                = backend.value.shield
      ssl_ca_cert           = backend.value.ssl_ca_cert
      ssl_cert_hostname     = backend.value.ssl_cert_hostname
      ssl_check_cert        = backend.value.ssl_check_cert
      ssl_ciphers           = backend.value.ssl_ciphers
      ssl_client_cert       = backend.value.ssl_client_cert
      ssl_client_key        = backend.value.ssl_client_key
      ssl_sni_hostname      = backend.value.ssl_sni_hostname
      use_ssl               = backend.value.use_ssl
      weight                = backend.value.weight


    }
  }

  dynamic "header" {
    for_each = var.fastly_enable_header ? (length(var.headers) > 0 ? var.headers : [local.default_header]) : []

    content {
      name          = header.value.name
      action        = header.value.action
      destination   = header.value.destination
      ignore_if_set = header.value.ignore_if_set
      priority      = header.value.priority
      source        = header.value.source
      type          = header.value.type
    }
  }

  dynamic "request_setting" {
    for_each = var.fastly_enable_request_settings ? [1] : []

    content {
      name             = var.fastly_request_setting_name
      bypass_busy_wait = var.fastly_request_setting_bypass_busy_wait
      force_miss       = var.fastly_request_setting_force_miss
      force_ssl        = var.fastly_request_setting_force_ssl
      max_stale_age    = var.fastly_request_setting_max_stale_age
      timer_support    = var.fastly_request_setting_timer_support
    }
  }
}