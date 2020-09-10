
pipeline {
    agent any
    environment{
      def mvnHome = tool name: 'maven3', type: 'maven'
      def mvnCMD = "${mvnHome}/bin/mvn"
      def ansible = tool name: 'Ansible', type: 'org.jenkinsci.plugins.ansible.AnsibleInstallation'
    }

    stages {
        stage('Git Clone'){
            steps{
              git 'https://github.com/ajibjawwad/sample-web-app.git'
            }
        }

        stage('Build Package'){
            steps{
              sh  "${mvnCMD} clean package"
            }
        }

        stage('Docker Build'){
            steps{
              sh 'docker build -t jebro/webapps:1.0 .'
            }
        }

        stage('Docker Push'){
            steps{
              withCredentials([string(credentialsId: 'dockerpwd', variable: 'dockerpwd')]) {
                sh "docker login -u jebro -p ${dockerpwd}"
              }
              sh 'docker push jebro/webapps:1.0'
            }
        }

        stage('Ansible Check'){
            steps{
              script{
                env.PATH = "${tfHome}:${env.PATH}"
                sh 'ansible --version'
              }

            }
        }

        stage('Deploy Apps'){
            steps{
              sh 'ansible-playbook ansible-deploy.yml'
            }
        }
    }
}
