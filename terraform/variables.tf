variable "virtual_machines" {
  default = ""
}

variable "s3bucket" {
  default = ""
}

variable "yc_service_account_id" {
  type      = string
  sensitive = true
  default   = env("YC_SERVICE_ACCOUNT_ID")
}
variable "yc_access_key_id" {
  type      = string
  sensitive = true
  default   = env("YC_ACCESS_KEY_ID")
}
variable "yc_secret_access_key" {
  type      = string
  sensitive = true
  default   = env("YC_SECRET_ACCESS_KEY")
}
