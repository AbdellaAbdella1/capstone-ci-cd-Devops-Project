pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                echo 'Building project...'
                sh 'echo "Build completed at $(date)"'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing project...'
                sh 'echo "Tests completed at $(date)"'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying project...'
                sh 'echo "Deployment completed at $(date)"'
            }
        }
    }
}
