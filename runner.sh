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
