resource "azurerm_resource_group" "dns_zones" {
  name     = "lasseheia-dns-zones-rg"
  location = "norwayeast"
}

resource "azurerm_dns_zone" "heia_consulting_no" {
  name                = "heiaconsulting.no"
  resource_group_name = azurerm_resource_group.dns_zones.name
}

resource "azurerm_dns_txt_record" "heia_consulting_no_root" {
  name                = "@"
  zone_name           = azurerm_dns_zone.heia_consulting_no.name
  resource_group_name = azurerm_resource_group.dns_zones.name
  ttl                 = 3600

  # Office 365 verification
  record {
    value = "MS=ms87443626"
  }

  # Office 365 SPF
  record {
    value = "v=spf1 include:spf.protection.outlook.com -all"
  }
}

resource "azurerm_dns_mx_record" "heia_consulting_no_root" {
  name                = "@"
  zone_name           = azurerm_dns_zone.heia_consulting_no.name
  resource_group_name = azurerm_resource_group.dns_zones.name
  ttl                 = 3600

  record {
    preference = 0
    exchange   = "heiaconsulting-no.mail.protection.outlook.com"
  }
}

resource "azurerm_dns_cname_record" "heia_consulting_no_autodiscover" {
  name                = "autodiscover"
  zone_name           = azurerm_dns_zone.heia_consulting_no.name
  resource_group_name = azurerm_resource_group.dns_zones.name
  ttl                 = 3600
  record              = "autodiscover.outlook.com"
}

resource "azurerm_dns_zone" "heia_consulting_com" {
  name                = "heiaconsulting.com"
  resource_group_name = azurerm_resource_group.dns_zones.name
}

resource "azurerm_dns_zone" "heia_consulting" {
  name                = "heia.consulting"
  resource_group_name = azurerm_resource_group.dns_zones.name
}

resource "azurerm_dns_txt_record" "heia_consulting_root" {
  name                = "@"
  zone_name           = azurerm_dns_zone.heia_consulting.name
  resource_group_name = azurerm_resource_group.dns_zones.name
  ttl                 = 3600

  # Office 365 verification
  record {
    value = "MS=ms41188846"
  }

  # Office 365 SPF
  record {
    value = "v=spf1 include:spf.protection.outlook.com -all"
  }
}

resource "azurerm_dns_mx_record" "heia_consulting_root" {
  name                = "@"
  zone_name           = azurerm_dns_zone.heia_consulting.name
  resource_group_name = azurerm_resource_group.dns_zones.name
  ttl                 = 3600

  record {
    preference = 0
    exchange   = "heia-consulting.mail.protection.outlook.com"
  }
}

resource "azurerm_dns_cname_record" "heia_consulting_autodiscover" {
  name                = "autodiscover"
  zone_name           = azurerm_dns_zone.heia_consulting.name
  resource_group_name = azurerm_resource_group.dns_zones.name
  ttl                 = 3600
  record              = "autodiscover.outlook.com"
}