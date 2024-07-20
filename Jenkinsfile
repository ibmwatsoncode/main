pipeline {
    agent any

    stages {
        stage('Run Shell Script') {
            steps {
                script {
                    sh '''
                        #!/bin/bash

                        getAllFiles() {
                            filePath="/Users/ambrishsingh/Desktop/watson/watsonx-code/src/components"
                            echo "Get all file names"
                            all_files=$(ls "$filePath")
                            echo "List of file paths"
                            for file in $all_files; do
                                echo "$filePath/$file"
                            done

                            finalString=""

                            for file in $all_files; do
                                apiEndpoint="https://api.us-south.natural-language-understanding.watson.cloud.ibm.com/instances/98cf80c57317/v1/analyze?version=2021-03-23"
                                headers=("Content-Type: application/json" "Authorization: Basic $(echo -n 'apikey:4rU8cgIFKCUiG_D0uXqFaEr' | base64)")

                                content=$(cat "$filePath/$file")

                                updatedParameters=$(jq --arg content "$content" '.text = $content')

                                response=$(curl -s -X POST -H "${headers[@]}" -d "$updatedParameters" "$apiEndpoint")
                                classification=$(echo "$response" | jq -r '.classifications[0].class_name')

                                finalString="$finalString $classification"
                            done

                            echo "Final String: $finalString"
                        }

                        getAllFiles
                    '''
                }
            }
        }
    }
}