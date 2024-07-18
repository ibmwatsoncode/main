pipeline {
  agent any
  stages {
    stage('version') {
      steps {
        sh 'pwsh --version'
      }
    }
    stage('git') {
      steps {
        sh 'pwsh runner.ps1'
      }
    }
  }
}