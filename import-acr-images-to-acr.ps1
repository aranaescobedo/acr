<#
    .DESCRIPTION
         This script imports images from Azure Container Registry (ACR) to an Azure Container Registry in the same subscription.
         Don't forget to start Docker Desktop if needed.
         
    .NOTES
        AUTHOR: Alexander Arana E
        LASTEDIT: Sept 25, 2023
#>

$importToAcrName = "<ACR_NAME>"
$importFromAcrName = "<ACR_NAME>"
$subscriptionName = "<SUBSCRIPTION_NAME>"

#An array of ACR images to be imported to ACR
$importImages = @(
    "<REPOSITORY_NAME:TAG>",
    "<REPOSITORY_NAME:TAG>",
)

#Logout from the current Docker registry
docker logout

#Login to Azure & set the active Azure subscription
#az login
az account set --name $subscriptionName

#Login to the ACR
az acr login --name $importToAcrName

foreach ($imageName in $importImages) {
    "[*] Importing $imageName to ${importToAcrName}..."
    az acr import `
    --name $importToAcrName `
    --source "$importFromAcrName.azurecr.io/$imageName" `
    --image $imageName 
}

#Source:
https://learn.microsoft.com/en-us/azure/container-registry/container-registry-import-images?tabs=azure-cli
