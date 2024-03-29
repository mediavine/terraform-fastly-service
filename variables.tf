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

variable "fastly_stale_if_error" {
  description = "Enables serving a stale object if there is an error"
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

####################
# Header Variables #
####################
variable "fastly_enable_header" {
  description = "Enable the header content block"
  type        = bool
  default     = false
}

variable "fastly_header_action" {
  description = "The action to perform on the header"
  type        = string
  default     = "set"
}

variable "fastly_header_destination" {
  description = "The destination of the header"
  type        = string
  default     = "http.Strict-Transport-Security"
}

variable "fastly_header_ignore_if_set" {
  description = "Ignore the header if it is already set"
  type        = bool
  default     = false
}

variable "fastly_header_name" {
  description = "The name of the header"
  type        = string
  default     = "Genereated by force TLS and enable HSTS"
}

variable "fastly_header_priority" {
  description = "The priority of the header"
  type        = number
  default     = 100
}

variable "fastly_header_source" {
  description = "The source of the header"
  type        = string
  default     = "\"max-age=300\""
}

variable "fastly_header_type" {
  description = "The type of the header"
  type        = string
  default     = "response"
}

variable "headers" {
  description = "List of headers and their attributes to be added to the Fastly service"
  type = list(object({
    name          = string
    action        = string
    destination   = string
    ignore_if_set = bool
    priority      = number
    source        = string
    type          = string
  }))
  default = []
}

################################
# Request Setting Variables #
################################
variable "fastly_enable_request_settings" {
  description = "Enable the request settings content block"
  type        = bool
  default     = false
}

variable "fastly_request_setting_bypass_busy_wait" {
  description = "Bypass busy wait"
  type        = bool
  default     = false
}

variable "fastly_request_setting_force_miss" {
  description = "Force miss"
  type        = bool
  default     = false
}

variable "fastly_request_setting_force_ssl" {
  description = "Force SSL"
  type        = bool
  default     = true
}

variable "fastly_request_setting_max_stale_age" {
  description = "The maximum stale age"
  type        = number
  default     = 0
}

variable "fastly_request_setting_name" {
  description = "The name of the request setting"
  type        = string
  default     = "Generated by force TLS and enable HSTS"
}

variable "fastly_request_setting_timer_support" {
  description = "Timer support"
  type        = bool
  default     = false
}

################################
# Backend Variables #
################################
variable "fastly_backends" {
  description = <<EOF
  A list of backends to be added to the Fastly service. Each object in the list has the following attributes:
  - address (String) An IPv4, hostname, or IPv6 address for the Backend
  - name (String) Name for this Backend. Must be unique to this Service. It is important to note that changing this attribute will delete and recreate the resource.
  - auto_loadbalance (Boolean) Denotes if this Backend should be included in the pool of backends that requests are load balanced against. Default false
  - between_bytes_timeout (Number) How long to wait between bytes in milliseconds. Default 10000
  - connect_timeout (Number) How long to wait for a timeout in milliseconds. Default 1000
  - error_threshold (Number) How many errors should be seen before this backend is considered unhealthy. Default 0
  - first_byte_timeout (Number) How long to wait for the first byte in milliseconds. Default 15000
  - healthcheck (String) The name of the healthcheck to use with this backend
  - keepalive_time (Number) How long to keep a connection to the backend open in seconds. Default 60
  - max_conn (Number) The maximum number of connections to the backend. Default 200
  - max_tls_version (String) The maximum version of TLS the backend supports
  - min_tls_version (String) The minimum version of TLS the backend supports
  - override_host (String) The hostname to override the Host header
  - port (Number) The port number of the address. Default 80
  - request_condition (String) Name of a condition, which if met, will select this backend during a request.
  - share_key (String) Value that when shared across backends will enable those backends to share the same health check.
  - shield (String) The POP of the shield designated to reduce inbound load. Valid values for shield are included in the GET /datacenters API response
  - ssl_ca_cert (String) CA certificate attached to origin.
  - ssl_cert_hostname (String) Configure certificate validation. Does not affect SNI at all
  - ssl_check_cert (Boolean) Check the backend certificate. Default true
  - ssl_ciphers (String) Cipher list consisting of one or more cipher strings separated by colons. Commas or spaces are also acceptable separators but colons are normally used.
  - ssl_client_cert (String) Client certificate attached to origin.
  - ssl_client_key (String, Sensitive) Client key attached to origin.
  - ssl_sni_hostname (String) SNI host name to use during SSL handshake. This is required when using SSL.
  - use_ssl (Boolean) Use SSL for this backend. Default false
  - weight (Number) Weight used to load balance this backend against others. Default 100
  EOF
  type = list(object({
    name                  = string
    address               = string
    auto_loadbalance      = optional(bool)
    between_bytes_timeout = optional(number)
    connect_timeout       = optional(number)
    error_threshold       = optional(number)
    first_byte_timeout    = optional(number)
    healthcheck           = optional(string)
    keepalive_time        = optional(number)
    max_conn              = optional(number)
    max_tls_version       = optional(string)
    min_tls_version       = optional(string)
    override_host         = optional(string)
    port                  = optional(number)
    request_condition     = optional(string)
    share_key             = optional(string)
    shield                = optional(string)
    ssl_ca_cert           = optional(string)
    ssl_cert_hostname     = optional(string)
    ssl_check_cert        = optional(bool)
    ssl_ciphers           = optional(string)
    ssl_client_cert       = optional(string)
    ssl_client_key        = optional(string)
    ssl_sni_hostname      = optional(string)
    use_ssl               = optional(bool)
    weight                = optional(number)
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