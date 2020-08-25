pipeline{
  agent {
    label 'SLAVE'
  }

  environment{
    NEXUS=credentials('Nexus')
    MAJOR_VERSION="1.0"
  }

  stages{
    stage('Install npm dependencies')
            {
              steps{
                sh '''
                npm install
            '''
              }
            }
    stage('Create archive to upload')
            {
              steps{
                sh '''
                tar -czf user-service-${MAJOR_VERSION}-${BUILD_NUMBER}.tgz node_modules package.json server.js
            '''
              }
            }
    stage('Upload to NEXUS')
            {
              steps{
                sh '''
                curl -v -u -f ${NEXUS} --upload-file user-service-${MAJOR_VERSION}-${BUILD_NUMBER}.tgz https://nexus.devops46.online/repository/user-service/user-service-${MAJOR_VERSION}-${BUILD_NUMBER}.tgz
            '''
              }
            }
  }
}