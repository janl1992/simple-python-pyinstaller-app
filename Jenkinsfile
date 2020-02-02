pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh "docker run --rm -v ${env.WORKSPACE}:${env.WORKSPACE} -w ${env.WORKSPACE} python:3-alpine python -m py_compile sources/add2vals.py sources/calc.py"
            }
        }
        stage('Test') {
            steps {
                sh "docker run --rm -v ${env.WORKSPACE}:${env.WORKSPACE} -w ${env.WORKSPACE} qnib/pytest py.test --verbose --junit-xml test-reports/results.xml sources/test_calc.py"
            }
            post {
                always {
                    junit 'test-reports/results.xml'
                }
            }
        }
        stage('Deploy') {
            steps {
                sh "docker run -v ${env.WORKSPACE}/sources:/src/ cdrx/pyinstaller-linux:latest ""pyinstaller --onefile add2vals.py"""
            }
            post {
                success {
                    archiveArtifacts 'sources/dist/add2vals'
                }
            }
         }
        }
     }