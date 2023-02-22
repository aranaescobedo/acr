<#
    .DESCRIPTION
         This script calculates the size of the repositories in the Azure Container Registry and outputs the results to the console.
         
    .NOTES
        AUTHOR: Alexander Arana E
        LASTEDIT: Feb 22, 2023
#>

param(
    [Parameter(Mandatory=$true)]
    [string]
    $acrName,

    [Parameter(Mandatory=$true)]
    [string]
    $subName
)

#Logging out of any current Docker logins to ensure that the login used is for the correct container registry.
docker logout

az login
az account set --name $subName
az acr login --name $acrName

$ht_image_size = @{}

$repositoryList = az acr repository list --name $acrName

#Removing any characters from the repository names that are not alphanumeric (i.e., letters and numbers), colon, forward slash, or hyphen. This is done to ensure that the repository names are in a format that the script can use to get the metadata for each repository.
$cleanRepositoryList = $repositoryList[1..($repositoryList.length - 2)] | ForEach-Object{$_ -replace '[^0-9a-zA-Z:\/-]+', ""} #Removing any characters that are not alphanumeric, colon, forward slash, or hyphen.

$totalRepoSize = 0
foreach ($repositoryName in $cleanRepositoryList) {
    "[*] Getting size for ${repositoryName}..."
    $repositoryMetadata = (az acr manifest list-metadata --name $repositoryName --registry $acrName | ConvertFrom-Json) | Where-Object {$_.tags -ne $null}
    $repoSize = [math]::Round(($repositoryMetadata.imageSize | Measure-Object -Sum).Sum / 1GB, 3) #Converting the result to gigabytes (GB) rounded to three decimal places.
    $ht_image_size.Add($repositoryName, $repoSize)
    "[*] ${repositoryName}: $repoSize GB "
    $totalRepoSize += $repoSize
}

$ht_image_size.GetEnumerator() | Sort-Object -Property value -Descending
"**** TOTAL SIZE: $totalRepoSize GB ***"
