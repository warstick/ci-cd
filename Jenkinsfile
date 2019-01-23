node {
    checkout scm
}

pipeline {
  agent {
    dockerfile true
  }
  environment {
        HOME = '.'
  }

  stages {
      stage('install dependencies') {
        steps {
            sh 'npm install'
        }    
      }
      stage('Build') {
          steps {
            sh 'node -v'
          }
      }
      stage('Test') {
          steps {
              sh 'npm run test'
          }
      }
      stage('artifacts') {
          steps {
              sh 'npm run build'
          }
      }
      stage('Aws version check') {
          steps {
              sh 'aws --version'
          }
      }
      stage('Elastic beanstalk Deploy') {
          steps {
              sh 'aws elasticbeanstalk describe-applications --application-name pipeline-demo'
              // sh 'rm -rf build/build.tar.gz'
          }
      }
  }
}
