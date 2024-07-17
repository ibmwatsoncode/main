$filePath ='..\src\components'
$apiEndpoint = 'https://api.us-south.natural-language-understanding.watson.cloud.ibm.com/instances/ab74b27e-d987-4b95-9a99-98cf80c57317/v1/analyze?version=2021-03-23'
$parametersFilePath = "../parameters.json"  # Update this path
$parameters1 = Get-Content -Path "../parameters.json" -Raw 



# Read the parameters from the JSON file
# $parameters = Get-Content $parametersFilePath -Raw

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
# Write-Output "parameters1 :" $parameters


$response = Invoke-RestMethod -Uri $apiEndpoint -Method Post -Headers $headers -Body $parameters1
Write-Output "output Initial :" $response



function Get-AllFile {
            Write-Host "Get the all file name"
            $all_file =Get-ChildItem -Path $filePath -Force

            Write-Output "List of file path" @$all_file

            $all_file | ForEach-Object -Parallel {

            $apiEndpoint = 'https://api.us-south.natural-language-understanding.watson.cloud.ibm.com/instances/ab74b27e-d987-4b95-9a99-98cf80c57317/v1/analyze?version=2021-03-23'
            $headers = @{
                    "Content-Type" = "application/json"
            }
                
                # Define the credentials
            $username = "apikey"
            $password = "4rU8cgIFKCUiG_D05rzI8jnLDHJBDFfKvR2jpuXqFaEr"
            $base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("${username}:${password}")))
                
                # Add the Authorization header
            $headers["Authorization"] = "Basic $base64AuthInfo"


            $parameters1 = Get-Content -Path "../parameters.json" -Raw 
            $parameters = Get-Content -Path "../parameters.json" -Raw | ConvertFrom-Json
            $content =Get-Content "$_"
            Write-Output "COntent :" $content
           

            foreach ($line in $content) {
                Write-Output "lines:" $line
                if ($line.Length -gt 15) {
       
            Write-Output "COntent2 :" $content
            Write-Output "parameters :" $parameters
            $parameters.text =$line

            # $parameters.text =$content
            $updatedParametersJson = $parameters | ConvertTo-Json -Depth 10
            Write-Output "Updatedparameters :" $updatedParametersJson

        
            # Make the API call
            $response = Invoke-RestMethod -Uri $apiEndpoint -Method Post -Headers $headers -Body $updatedParametersJson

            # Extract and display classifications
            $classifications = $response.classifications
            Write-Output "Initial String: " $classifications[0].class_name

            $finalString = $finalString + $classifications[0].class_name
            Write-Output "Iteration Done."
        }
    }
    Write-Output "Final String: " $finalString
}
    
}

Get-AllFile
