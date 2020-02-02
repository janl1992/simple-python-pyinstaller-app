pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'docker run -v "$(pwd)/sources:/src/" cdrx/pyinstaller-linux:latest'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}