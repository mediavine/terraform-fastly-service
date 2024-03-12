## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_fastly"></a> [fastly](#requirement\_fastly) | >= 5.6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_fastly"></a> [fastly](#provider\_fastly) | 5.6.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [fastly_service_vcl.this](https://registry.terraform.io/providers/fastly/fastly/latest/docs/resources/service_vcl) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_fastly_activate"></a> [fastly\_activate](#input\_fastly\_activate) | Conditionally prevents the Service from being activated. The apply step will continue to create a new draft version but will not activate it if this is set to false | `bool` | `true` | no |
| <a name="input_fastly_api_key"></a> [fastly\_api\_key](#input\_fastly\_api\_key) | The Fastly API key | `string` | n/a | yes |
| <a name="input_fastly_backends"></a> [fastly\_backends](#input\_fastly\_backends) | A list of backends to be added to the Fastly service. Each object in the list has the following attributes:<br>  - address (String) An IPv4, hostname, or IPv6 address for the Backend<br>  - name (String) Name for this Backend. Must be unique to this Service. It is important to note that changing this attribute will delete and recreate the resource.<br>  - auto\_loadbalance (Boolean) Denotes if this Backend should be included in the pool of backends that requests are load balanced against. Default false<br>  - between\_bytes\_timeout (Number) How long to wait between bytes in milliseconds. Default 10000<br>  - connect\_timeout (Number) How long to wait for a timeout in milliseconds. Default 1000<br>  - error\_threshold (Number) How many errors should be seen before this backend is considered unhealthy. Default 0<br>  - first\_byte\_timeout (Number) How long to wait for the first byte in milliseconds. Default 15000<br>  - healthcheck (String) The name of the healthcheck to use with this backend<br>  - keepalive\_time (Number) How long to keep a connection to the backend open in seconds. Default 60<br>  - max\_conn (Number) The maximum number of connections to the backend. Default 200<br>  - max\_tls\_version (String) The maximum version of TLS the backend supports<br>  - min\_tls\_version (String) The minimum version of TLS the backend supports<br>  - override\_host (String) The hostname to override the Host header<br>  - port (Number) The port number of the address. Default 80<br>  - request\_condition (String) Name of a condition, which if met, will select this backend during a request.<br>  - share\_key (String) Value that when shared across backends will enable those backends to share the same health check.<br>  - shield (String) The POP of the shield designated to reduce inbound load. Valid values for shield are included in the GET /datacenters API response<br>  - ssl\_ca\_cert (String) CA certificate attached to origin.<br>  - ssl\_cert\_hostname (String) Configure certificate validation. Does not affect SNI at all<br>  - ssl\_check\_cert (Boolean) Check the backend certificate. Default true<br>  - ssl\_ciphers (String) Cipher list consisting of one or more cipher strings separated by colons. Commas or spaces are also acceptable separators but colons are normally used.<br>  - ssl\_client\_cert (String) Client certificate attached to origin.<br>  - ssl\_client\_key (String, Sensitive) Client key attached to origin.<br>  - ssl\_sni\_hostname (String) SNI host name to use during SSL handshake. This is required when using SSL.<br>  - use\_ssl (Boolean) Use SSL for this backend. Default false<br>  - weight (Number) Weight used to load balance this backend against others. Default 100 | <pre>list(object({<br>    name                  = string<br>    address               = string<br>    auto_loadbalance      = optional(bool)<br>    between_bytes_timeout = optional(number)<br>    connect_timeout       = optional(number)<br>    error_threshold       = optional(number)<br>    first_byte_timeout    = optional(number)<br>    healthcheck           = optional(string)<br>    keepalive_time        = optional(number)<br>    max_conn              = optional(number)<br>    max_tls_version       = optional(string)<br>    min_tls_version       = optional(string)<br>    override_host         = optional(string)<br>    port                  = optional(number)<br>    request_condition     = optional(string)<br>    share_key             = optional(string)<br>    shield                = optional(string)<br>    ssl_ca_cert           = optional(string)<br>    ssl_cert_hostname     = optional(string)<br>    ssl_check_cert        = optional(bool)<br>    ssl_ciphers           = optional(string)<br>    ssl_client_cert       = optional(string)<br>    ssl_client_key        = optional(string)<br>    ssl_sni_hostname      = optional(string)<br>    use_ssl               = optional(bool)<br>    weight                = optional(number)<br>  }))</pre> | <pre>[<br>  {<br>    "address": "example.com",<br>    "auto_loadbalance": false,<br>    "between_bytes_timeout": 10000,<br>    "connect_timeout": 1000,<br>    "error_threshold": 0,<br>    "first_byte_timeout": 15000,<br>    "max_conn": 200,<br>    "name": "example-backend",<br>    "port": 80,<br>    "ssl_check_cert": true,<br>    "use_ssl": false,<br>    "weight": 100<br>  }<br>]</pre> | no |
| <a name="input_fastly_domain_comment"></a> [fastly\_domain\_comment](#input\_fastly\_domain\_comment) | A comment to be added to the domain | `string` | `""` | no |
| <a name="input_fastly_domain_name"></a> [fastly\_domain\_name](#input\_fastly\_domain\_name) | The name of the domain to be added to the Fastly service | `string` | n/a | yes |
| <a name="input_fastly_enable_header"></a> [fastly\_enable\_header](#input\_fastly\_enable\_header) | Enable the header content block | `bool` | `false` | no |
| <a name="input_fastly_enable_request_settings"></a> [fastly\_enable\_request\_settings](#input\_fastly\_enable\_request\_settings) | Enable the request settings content block | `bool` | `false` | no |
| <a name="input_fastly_force_destroy"></a> [fastly\_force\_destroy](#input\_fastly\_force\_destroy) | When destroying a service, the force\_destroy option must be set to true in order to destroy the service | `bool` | `false` | no |
| <a name="input_fastly_header_action"></a> [fastly\_header\_action](#input\_fastly\_header\_action) | The action to perform on the header | `string` | `"set"` | no |
| <a name="input_fastly_header_destination"></a> [fastly\_header\_destination](#input\_fastly\_header\_destination) | The destination of the header | `string` | `"http.Strict-Transport-Security"` | no |
| <a name="input_fastly_header_ignore_if_set"></a> [fastly\_header\_ignore\_if\_set](#input\_fastly\_header\_ignore\_if\_set) | Ignore the header if it is already set | `bool` | `false` | no |
| <a name="input_fastly_header_name"></a> [fastly\_header\_name](#input\_fastly\_header\_name) | The name of the header | `string` | `"Genereated by force TLS and enable HSTS"` | no |
| <a name="input_fastly_header_priority"></a> [fastly\_header\_priority](#input\_fastly\_header\_priority) | The priority of the header | `number` | `100` | no |
| <a name="input_fastly_header_source"></a> [fastly\_header\_source](#input\_fastly\_header\_source) | The source of the header | `string` | `"\"max-age=300\""` | no |
| <a name="input_fastly_header_type"></a> [fastly\_header\_type](#input\_fastly\_header\_type) | The type of the header | `string` | `"response"` | no |
| <a name="input_fastly_request_setting_bypass_busy_wait"></a> [fastly\_request\_setting\_bypass\_busy\_wait](#input\_fastly\_request\_setting\_bypass\_busy\_wait) | Bypass busy wait | `bool` | `false` | no |
| <a name="input_fastly_request_setting_force_miss"></a> [fastly\_request\_setting\_force\_miss](#input\_fastly\_request\_setting\_force\_miss) | Force miss | `bool` | `false` | no |
| <a name="input_fastly_request_setting_force_ssl"></a> [fastly\_request\_setting\_force\_ssl](#input\_fastly\_request\_setting\_force\_ssl) | Force SSL | `bool` | `true` | no |
| <a name="input_fastly_request_setting_max_stale_age"></a> [fastly\_request\_setting\_max\_stale\_age](#input\_fastly\_request\_setting\_max\_stale\_age) | The maximum stale age | `number` | `0` | no |
| <a name="input_fastly_request_setting_name"></a> [fastly\_request\_setting\_name](#input\_fastly\_request\_setting\_name) | The name of the request setting | `string` | `"Generated by force TLS and enable HSTS"` | no |
| <a name="input_fastly_request_setting_timer_support"></a> [fastly\_request\_setting\_timer\_support](#input\_fastly\_request\_setting\_timer\_support) | Timer support | `bool` | `false` | no |
| <a name="input_fastly_service_name"></a> [fastly\_service\_name](#input\_fastly\_service\_name) | The name of the Fastly service | `string` | n/a | yes |
| <a name="input_fastly_stale_if_error"></a> [fastly\_stale\_if\_error](#input\_fastly\_stale\_if\_error) | Enables serving a stale object if there is an error | `bool` | `false` | no |
| <a name="input_headers"></a> [headers](#input\_headers) | List of headers and their attributes to be added to the Fastly service | <pre>list(object({<br>    name          = string<br>    action        = string<br>    destination   = string<br>    ignore_if_set = bool<br>    priority      = number<br>    source        = string<br>    type          = string<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_fastly_service_id"></a> [fastly\_service\_id](#output\_fastly\_service\_id) | n/a |
| <a name="output_fastly_service_name"></a> [fastly\_service\_name](#output\_fastly\_service\_name) | n/a |
