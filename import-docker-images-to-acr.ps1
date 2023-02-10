<#
    .DESCRIPTION
         This scripts imports Docker images from Docker Hub to an Azure Container Registry for container management, scanning and deployment.

    .NOTES
        AUTHOR: Alexander Arana E
        LASTEDIT: Feb 09, 2023
#>

$acrName = "<ADD_YOUR_ARC_NAME>"
$subscriptionName = "<SUBSCRIPTION_NAME_WHERE_THE_ACR_IS_LOCATED>"

# An array of Docker images to be imported to ACR
$importImages = @(
    "<REPOSITORY_NAME:TAG>",
    "<REPOSITORY_NAME:TAG>",
)

# Logout from the current Docker registry
docker logout

# Login to Azure & set the active Azure subscription
az login
az account set --name $subscriptionName

# Login to the ACR 
az acr login --name $acrName

# Import the image to the ACR
foreach ($imageName in $importImages) {
    "[*] Importing $imageName to ${acrName}..."
    az acr import `
    --name $acrName `
    --source docker.io/$imageName `
    --image $imageName 
}

#Attn: If you get Error 401 unauthorized, it could mean that you need to add /library/ in row 34! Example: docker.io/library/$imageName

#Source:
#https://github.com/Azure/acr/issues/457
