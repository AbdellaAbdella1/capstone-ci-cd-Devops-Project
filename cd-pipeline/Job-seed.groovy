def pipelineScript = '''
pipeline {
    agent any
    
    environment {
        DOCKER_REGISTRY = 'your-dockerhub-username'
        APP_NAME = 'microservice-app'
        K8S_NAMESPACE = 'microservices'
        MONITORING_NAMESPACE = 'monitoring'
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Test') {
            steps {
                script {
                    dir('app') {
                        sh 'npm install'
                        sh 'npm test || true'
                    }
                }
            }
        }
        
        stage('Build & Scan') {
            steps {
                script {
                    docker.build("${DOCKER_REGISTRY}/${APP_NAME}:${env.BUILD_ID}", "-f docker/Dockerfile .")
                }
            }
        }
        
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    sh "kubectl apply -f k8s/"
                    sh "kubectl apply -f monitoring/"
                    sh "kubectl rollout status deployment/microservice-deployment -n ${K8S_NAMESPACE}"
                }
            }
        }
        
        stage('Integration Test') {
            steps {
                script {
                    sh 'curl -f http://$(minikube ip):30000/health || exit 1'
                }
            }
        }
    }
    
    post {
        always {
            echo "Pipeline execution completed"
        }
        success {
            echo "✅ Pipeline executed successfully"
        }
        failure {
            echo "❌ Pipeline execution failed"
        }
    }
}
'''

pipelineJob('microservice-cicd') {
    definition {
        cps {
            script(pipelineScript)
            sandbox()
        }
    }
    
    parameters {
        stringParam('DOCKER_REGISTRY', 'your-dockerhub-username', 'Docker registry username')
        stringParam('APP_VERSION', '1.0.0', 'Application version')
    }
}
