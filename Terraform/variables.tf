variable "resource_group_name" {
    default = "rg-sentinel-euw"
}

variable "location" {
    default = "westeurope"
}

variable "sentinel_law_name" {
    default = "law-sentinel-euw"
}

variable "sentinel_law_retention" {
    default = 90
}

variable "sentinel_mdc_connector_name" {
    default = "mdc-connector"
}
