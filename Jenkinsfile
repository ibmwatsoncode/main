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
         'pwsh runner.ps1'
      }
    }
  }
}