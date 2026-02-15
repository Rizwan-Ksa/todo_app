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
                sh 'docker build . -t rizwan001/django-todo-cicd:latest'
            }
        }
        stage('Docker Push') {
            steps {
                
                withCredentials([usernamePassword(credentialsId: 'dockerHub', usernameVariable: 'dockerHubUser', passwordVariable: 'dockerHubPassword')]){
                sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
                sh 'docker push rizwan001/django-todo-cicd:latest'
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
