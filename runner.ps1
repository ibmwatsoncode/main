$filePath ='./src/components'

function Get-AllFile {
            Write-Host "Get the all file name"
            $all_file =Get-ChildItem -Path $filePath -Force

            Write-Output "List of file path" @$all_file

            $all_file | ForEach-Object -Parallel {
            $content =Get-Content "$_"
            Write-Output "Output: " $content
}
    
}


Get-AllFile