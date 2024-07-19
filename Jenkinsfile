pipeline {
    agent any

    stages {
        stage('Run Shell Script') {
            steps {
                script {
                   node{ sh '''
                        #!/bin/bash

                        # Define the function to get all file content from the specified directory
                        getAllFiles() {
                          filePath='/Users/ambrishsingh/Desktop/watson/watsonx-code/src/components'
                          echo "Get all file names"
                          all_files=$(ls "$filePath")
                          echo "List of file paths"
                          for file in $all_files; do
                            echo "$filePath/$file"
                          done

                          for file in $all_files; do
                            content=$(cat "$filePath/$file")
                            echo "Output: $content"
                          done
                        }

                        # Call the function
                        getAllFiles
                    '''
                }
                }
            }
        }
    }
}