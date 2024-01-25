pipeline {
   // agent { label 'dev' }
    agent any
    stages {
        stage("Code") {
            steps {
                git url: "https://github.com/Simbaa815/2048-devops-project.git", branch: "master" 
            }
        }
        stage("Build and Test") {
            steps {
                sh "docker build . -t 2048:latest"
            }
        }
        stage("Login and Push") {
            steps {
                withCredentials([usernamePassword(credentialsId:"dockerhub",passwordVariable:"password",usernameVariable:"user")]) {
                    sh "docker login -u ${env.user} -p ${env.password}"
                    sh "docker tag 2048 ${env.user}/2048-game:latest"
                    sh "docker push ${env.user}/2048-game:latest"
                }
            }
        }
        stage("Deploy") {
            steps {
                sh "docker-compose down && docker-compose up -d"
            }
        }
    }
}
