pipeline {
    agent any
    
    stages {
        stage('Code') {
            steps {
                
                git url: 'https://github.com/Rizwan-Ksa/todo_app.git' , branch: 'main'
            }
        }
        stage('Build') {
            steps {
                sh 'docker build . -t rizwanuddindev/django-todo:v2'
            }
        }
        stage('Docker Push') {
            steps {
                
                withCredentials([usernamePassword(credentialsId: 'DockerHub', usernameVariable: 'dockerHubUser', passwordVariable: 'dockerHubPassword')]){
                sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
                sh 'docker push rizwanuddindev/django-todo:v2'
                }
            }
        }
        stage('Test'){
            steps {
                echo 'Testing the build'
            }
        }
        stage('Deploy'){
            steps {
                sh 'docker-compose down && docker-compose up -d'
            }
        }
    }
}
