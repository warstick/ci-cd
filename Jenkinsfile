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
              sh 'aws elasticbeanstalk describe-applications --application-name pipeline-demo --region us-east-2'
              echo 'copying file to s3 bucker'
              
              sh 'aws s3 cp build/build.tar.gz s3://jenkins-test-pipeline/ebs/'
              echo 'create application in EBS'
              sh 'aws elasticbeanstalk create-application-version --application-name pipeline-demo --version-label v1.0.0 --source-bundle S3Bucket="s3://jenkins-test-pipeline/ebs/",S3Key="build.tar.gz"'
              
              echo 'create environment'
              sh 'aws elasticbeanstalk create-environment --application-name pipeline-demo --environment-name pipeline-demo --cname-prefix my-app --version-label v1.0.0 --solution-stack-name "64bit Amazon Linux 2018.03 v4.8.0 running Node.js"'


              // echo 'updating environment'
              //sh 'aws elasticbeanstalk update-environment --application-name pipeline-demo --environment-name YourEBSEnvironmentName --version-label 1.0.0'
              // sh 'rm -rf build/build.tar.gz'
          }
      }
  }
}
