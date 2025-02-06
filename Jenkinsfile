pipeline {
    agent any

    environment {
        DOCKER_USERNAME = credentials('DOCKER_USERNAME')
        DOCKER_PASSWORD = credentials('DOCKER_PASSWORD')
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/GSreevadhani/GuviTask-DevOps.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'chmod +x build.sh'
                sh './build.sh'
            }
        }

        stage('Login to Docker Hub') {
            steps {
                sh 'echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                sh 'docker tag my-react-app sreevadhani/app'
                sh 'docker push sreevadhani/app'
            }
        }
    }
}
