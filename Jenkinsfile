pipeline {
  agent any
  stages {
    stage('version') {
      steps {
        sh 'pwsh --version'
      }
    }
    stage('hello') {
      steps {
        powershell 'runner.ps1'
      }
    }
  }
}