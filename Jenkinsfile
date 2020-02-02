pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'docker run -it --rm -v "$PWD":/var/jenkins_home/workspace/pythontespipeline -w /var/jenkins_home/workspace/pythontespipeline python:3-alpine python -m py_compile sources/add2vals.py sources/calc.py'
            }
        }
        stage('Test') {
            steps {
                echo 'docker run -it --rm -v "$PWD":/var/jenkins_home/workspace/pythontespipeline -w /var/jenkins_home/workspace/pythontespipeline/ qnib/pytest py.test --verbose --junit-xml test-reports/results.xml sources/test_calc.py'
            }
            post {
                always {
                    junit 'test-reports/results.xml'
                }
        }
        }
        stage('Deploy') {
            steps {
                echo 'docker run -v "$(pwd)/sources:/src/" cdrx/pyinstaller-linux:latest'
            }
        }
    }
}