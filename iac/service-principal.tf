variable "subscription_id" {  
}

variable "client_id" {  
}

variable "client_secret" {

}

variable "tenant_id" {
  
}


# Configure the Microsoft Azure Active Directory Provider
provider "azuread" {
#   version = "=0.3.0"

  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  tenant_id       = "${var.tenant_id}"
}

# Create an application
resource "azuread_application" "aplication_registration" {
  name = "HelloTerraform"
}

# Create a service principal
resource "azuread_service_principal" "service_principal" {
  application_id = "${azuread_application.aplication_registration.application_id}"
}