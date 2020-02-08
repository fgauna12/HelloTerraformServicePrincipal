# Configure the Microsoft Azure Active Directory Provider
provider "azuread" {
#   version = "=0.3.0"
}

# Create an application
resource "azuread_application" "aplication_registration" {
  name = "HelloTerraform"
}

# Create a service principal
resource "azuread_service_principal" "service_principal" {
  application_id = "${azuread_application.aplication_registration.application_id}"
}