# Proyecto Azure-Architecture 

Proyecto practico para implemtentar todo el flujo CI/CD, con Terraform y GitHub Actions, el cual sera documentado completamente para comprender cada recurso implementado, desde la preparación del ambiente hasta cada detalle de uso de cada recurso.

1. Esquema propuesto para la practica.

![alt text](image.png)

2. Para esta practica utilizaremos GNU/Linux 🐧, donde instalaremos los recursos necesarios para el despliegue.

    2.1. **Instalación Azure-CLI**
    
    *URL Azure*
    ```text
    https://learn.microsoft.com/es-es/cli/azure/install-azure-cli-linux?view=azure-cli-latest&pivots=apt
    ```
    2.2 Una vez instalado utlizamos el siguiente comando para realizar el login con nuestra cuenta de Azure
    
    *Bash*
    ```text
    az login --use-device-code
    ```
    2.3. **Instalación Terraform**
    
    *URL Terraform*
    ```text
    https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
    ```
3. Utilizaremos un backend remoto para seguir las buenas practicas, la cual garantizamos que nuestro archivo .tfstate se encuentra seguro en una cuenta de almacenamiento de Azure.

    3.1 Creamos un archivo de nombre ```provider.tf``` y colocamos la siguiente información:
    ```text
    terraform {
      required_providers {
        azurerm = {
          source  = "hashicorp/azurerm"
          version = "4.69.0"
        }
      }

      backend "azurerm" {}
    }
    ```
    *Nota:* la versión del provedor requerido la tomamos de la documentación oficial de Terraform.
    
    3.2 Creamos un archivo de nombre ```backend.hcl``` el cual contiene la siguiente información:
    ```text
    resource_group_name  = "graveweave"
    storage_account_name = "stgraveweave"                                
    container_name       = "terraform-state"              
    key                  = "dev.terraform.tfstate"
    ```
    *Nota:* Estos recursos se deben primero crear manualmente en el portal de Azure.

    3.3 Ejecutamos el siguiente comando:

    *bash*
    ```text
    terraform init -backend-config="backend.hcl"
    ```
    Resultado:

    ![alt text](image-1.png)