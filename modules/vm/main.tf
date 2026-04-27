
resource "azurerm_network_interface" "nic" {
  name                = "nic"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }

  tags = var.tags
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                            = "linuxvm"
  resource_group_name             = var.rg_name
  location                        = var.location
  size                            = var.size_vm
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  identity {
    type = "SystemAssigned"
  }

  custom_data = base64encode(
    <<-EOF
#!/bin/bash
sudo apt-get update -y
sudo apt-get install cifs-utils -y
sudo mkdir -p /mnt/azuredata
sudo mount -t cifs //${var.storage_account_name}.file.core.windows.net/${var.storage_share_name} /mnt/azuredata \
-o vers=3.0,username=${var.storage_account_name},password=${var.storage_account_key},dir_mode=0777,file_mode=0777,serverino
EOF
  )

  tags = var.tags
}

resource "azurerm_role_assignment" "vm_access" {
  scope                = var.storage_account_id
  role_definition_name = "Storage File Data SMB Share Contributor"
  principal_id         = azurerm_linux_virtual_machine.vm.identity[0].principal_id
}

