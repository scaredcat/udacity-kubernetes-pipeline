pipeline {
    agent any
    stages {
        stage('Lint') {
            steps {
                sh 'tidy -q -e frontend/*.html'
            }
        }
        stage('Build') {
            steps {
                sh 'docker build . --tag scaredcat/udacity-kube:$(git rev-parse --short HEAD)'
                sh 'docker push scaredcat/udacity-kube:$(git rev-parse --short HEAD)'
            }
        }
    }
}