<p align="center">
 <img width="100px" src=".images/azure-container-registries.svg" align="center" alt="Azure Container Registries" />
 <h2 align="center">Azure Container Registries(ACR)</h2>
 <p align="center">This repository contains scripts that are used to interact with Azure Container Registries (ACR).</p>
</p>


## Prerequisites

- [A valid Azure account][azure-account]
- [Azure CLI][azure-cli]
- [Docker Desktop/CLI][docker-desktop]

## Usage
Each script in this folder is designed to perform a specific task with ACR. Before running a script, make sure to replace any placeholders with your own information.

## Script Descriptions

- **[images-vulnerability-findings-mdvm.kql]**: Identifies vulnerabilities in container images running on your Kubernetes clusters for specific CVE vulnerabilities, powered by powered by Microsoft Defender Vulnerability Management.
  
- **[images-vulnerability-findings-qualys.kql]**: Identifies vulnerabilities in container images running on your Kubernetes clusters for specific CVE vulnerabilities, powered by Qualys.
  
- **[import-docker-images-to-acr.ps1]**: Imports Docker images from Docker Hub to your ACR for efficient storage and distribution.
  
- **[import-acr-images-to-acr.ps1]**: Imports images from Azure Container Registry (ACR) to an Azure Container Registry in the same subscription.
  
- **[repository-image-size.ps1]**: Calculates the size of the repositories in the Azure Container Registry and outputs the results to the console.


## Disclaimer
Please note that this is provided as-is and may not suit all use cases. Use at your own discretion and make sure to thoroughly test before deployment in a production environment.

[azure-cli]: https://docs.microsoft.com/en-us/cli/azure
[azure-account]: https://azure.microsoft.com/en-us/free
[docker-desktop]:https://docs.docker.com/get-docker/
[images-vulnerability-findings-mdvm.kql]:images-vulnerability-findings-mdvm.kql
[images-vulnerability-findings-qualys.kql]:images-vulnerability-findings-qualys.kql
[import-docker-images-to-acr.ps1]:import-docker-images-to-acr.ps1
[import-acr-images-to-acr.ps1]:import-acr-images-to-acr.ps1
[repository-image-size.ps1]:repository-image-size.ps1
