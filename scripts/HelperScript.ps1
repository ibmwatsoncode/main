$filePath ='..\src\components'


function Get-WatsonCodeHttp {
  
param (
    [Parameter(Mandatory=$true, Position=0)]
    [string]$WatsonPromtFirst
)
    Write-Output $WatsonPromtFirst #$WatsonPromtSecond inputFileContent
}

function Get-AllFile {
            Write-Host "Get the all file name"
            $all_file =Get-ChildItem -Path $filePath -Force

            Write-Output "List of file path" @$all_file

            $all_file | ForEach-Object -Parallel {
            $content =Get-Content "$_"
            Write-Output "Output: " $content


            #Get-WatsonCodeHttp "Explain the below code"
}
    
}

#cd src/components
#cat Home.jsx


Get-AllFile