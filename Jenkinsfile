pipeline {
    agent any
    stages {
        stage('Run PowerShell Script from File') {
            steps {
                script {
                    def scriptContent = readFile("/Users/ambrishsingh/.jenkins/workspace/Powershell/runner.ps1")
                    powershell(scriptContent)
                }
            }
        }
    }
}