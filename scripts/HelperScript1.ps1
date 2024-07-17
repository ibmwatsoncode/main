
# Define the API endpoint and parameters file path
$apiEndpoint = 'https://api.us-south.natural-language-understanding.watson.cloud.ibm.com/instances/ab74b27e-d987-4b95-9a99-98cf80c57317/v1/analyze?version=2021-03-23'
$parametersFilePath = "../parameters.json"  # Update this path
# $parametersFilePath = "../parameters.json"  # Update this path

# Read the parameters from the JSON file
$parameters = Get-Content $parametersFilePath -Raw

# Define the headers
$headers = @{
    "Content-Type" = "application/json"
}

# Define the credentials
$username = "apikey"
$password = "4rU8cgIFKCUiG_D05rzI8jnLDHJBDFfKvR2jpuXqFaEr"
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("${username}:${password}")))

# Add the Authorization header
$headers["Authorization"] = "Basic $base64AuthInfo"

Write-Output "parameters :" $parameters

# Make the API call
$response = Invoke-RestMethod -Uri $apiEndpoint -Method Post -Headers $headers -Body $parameters

# Print the response
Write-Output $response
