pipeline {
    agent {
        docker {
            image 'golang:1.22'
        }
    }
    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/nadavlit11/my_proj', branch: 'main'
            }
        }
        stage('Build') {
            steps {
                sh 'go build -o app'
            }
        }
        stage('Test') {
            steps {
                sh 'go test ./...'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}