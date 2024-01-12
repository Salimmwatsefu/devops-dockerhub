pipeline {
    agent any
    tools{
        maven 'maven_3_5_0'
    }
    
    
    environment {
        DOCKERHUB_CREDENTIALS = credentials('sjmwatsefu-dockerhub')
       
    }
    stages{
        stage('Build Maven'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Salimmwatsefu/devops-dockerhub']]])
                sh 'mvn clean install'
            }
        }
        stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t sjmwatsefu/devops-intergration-image3:v2 .'
                    

                }
            }
        }
        stage('Login to DockerHub'){
            steps{
               sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Push Image'){
            steps{
                sh 'docker push sjmwatsefu/devops-intergration-image3:v2'
            }
        }
    }
}

