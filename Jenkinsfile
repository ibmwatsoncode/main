pipeline {
    agent any
    stages {
        stage('Run PowerShell Script from File') {
            steps {
                script {
                    def scriptContent = readFile("./runner.ps1")
                    powershell(scriptContent)
                }
            }
        }
    }
}