node {
    checkout scm
}

pipeline {
  agent {
    docker {
        image 'node:11.6.0'
    }
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
              echo 'build step'
          }
      }
      stage('Deploy') {
          steps {
              
              /**
              withAWS(region: 'us-east-2') {
                  s3Upload(file:'build/build.tar.gz', bucket:'jenkins-test-pipeline', path:'/')
              }
             **/
              
              step([
                  $class: 'AWSCodeDeployPublisher',
                  applicationName: 'pipeline-demo',
                  // awsAccessKey: '',
                  // awsSecretKey: '',
                  // credentials: 'awsAccessKey',
                  deploymentGroupAppspec: false,
                  deploymentGroupName: 'pipeline-demo',
                  deploymentMethod: 'deploy',
                  excludes: 'node_modules/**',
                  // iamRoleArn: '',
                  includes: '**',
                  proxyPort: 0,
                  region: 'us-east-2',
                  s3bucket: 'peerfeed',
                  s3prefix: 'server-node',
                  versionFileName: 'build',
                  waitForCompletion: true
              ])

              echo 'Deploying...'
              // sh 'rm -rf build/build.tar.gz'
          }
      }
  }
}
