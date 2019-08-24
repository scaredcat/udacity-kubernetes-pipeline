pipeline {
    environment {
        registryCredential = 'dockerhub'
    }
    agent any
    stages {
        stage('Lint') {
            steps {
                sh 'tidy -q -e frontend/*.html'
            }
        }
        stage('Build') {
            steps {
                script {
                    dockerImage = docker.build("scaredcat/udacity-kube:${env.GIT_COMMIT[0..7]}")
                    docker.withRegistry('', registryCredential) {
                        dockerImage.push()
                    }
                }
            }
        }
        stage('Check') {
            steps {
                script {
                    sh "kubectl set image deployment/udacity-deployment scaredcat/udacity-kube:${env.GIT_COMMIT[0..7]}"
                }
            }
        }
    }
}