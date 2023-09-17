resource "azurerm_resource_group" "dns_zones" {
  name     = "lasseheia-dns-zones-rg"
  location = "norwayeast"
}

resource "azurerm_dns_zone" "heia_consulting_no" {
  name                = "heiaconsulting.no"
  resource_group_name = azurerm_resource_group.dns_zones.name
}

resource "azurerm_dns_txt_record" "heia_consulting_no_office365_verification" {
  name                = "@"
  zone_name           = azurerm_dns_zone.heia_consulting_no.name
  resource_group_name = azurerm_resource_group.dns_zones.name
  ttl                 = 3600

  record {
    value = "MS=ms87443626"
  }
}

resource "azurerm_dns_mx_record" "heia_consulting_no_office365_email" {
  name                = "@"
  zone_name           = azurerm_dns_zone.heia_consulting_no.name
  resource_group_name = azurerm_resource_group.dns_zones.name
  ttl                 = 3600

  record {
    preference = 0
    exchange   = "heiaconsulting-no.mail.protection.outlook.com"
  }
}

resource "azurerm_dns_cname_record" "heia_consulting_no_office365_email" {
  name                = "autodiscover"
  zone_name           = azurerm_dns_zone.heia_consulting_no.name
  resource_group_name = azurerm_resource_group.dns_zones.name
  ttl                 = 3600
  record              = "autodiscover.outlook.com"
}

resource "azurerm_dns_txt_record" "heia_consulting_no_office365_email" {
  name                = "@"
  zone_name           = azurerm_dns_zone.heia_consulting_no.name
  resource_group_name = azurerm_resource_group.dns_zones.name
  ttl                 = 3600

  record {
    value = "v=spf1 include:spf.protection.outlook.com -all"
  }
}

resource "azurerm_dns_zone" "heia_consulting_com" {
  name                = "heiaconsulting.com"
  resource_group_name = azurerm_resource_group.dns_zones.name
}
