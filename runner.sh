// Assisted by WCA@IBM
// Latest GenAI contribution: ibm/granite-20b-code-instruct-v2
#!/bin/bash

filePath='./src/components'

getAllFile() {
  echo "Get the all file name"
  all_file=$(ls $filePath)

  echo "List of file path"
  echo $all_file

  for file in $all_file; do
    content=$(cat $file)
    echo "Output: " $content
  done
}

getAllFile


curl -X POST -header "Content-Type: application/x-www-form-urlencoded" -data "grant_type=urn:ibm:params:oauth:grant-type:apikey&apikey={apikey}" "https://iam.cloud.ibm.com/identity/token"
