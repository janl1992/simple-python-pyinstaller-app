pipeline {
    agent any

    stages {
        stage('Printtest') {
            def jobbasename = ${env.JOB_BASE_NAME}
            steps {
                echo '/var/jenkins_home/workspace/${jobbasename}'
            }
        }
//         stage('Build') {
//             steps {
//                 sh 'docker run --rm -v "$PWD":/var/jenkins_home/workspace/pythontespipeline -w /var/jenkins_home/workspace/pythontespipeline python:3-alpine python -m py_compile sources/add2vals.py sources/calc.py'
//             }
//         }
//         stage('Test') {
//             steps {
//                 sh 'docker run --rm -v "$PWD":/var/jenkins_home/workspace/pythontespipeline -w /var/jenkins_home/workspace/pythontespipeline/ qnib/pytest py.test --verbose --junit-xml test-reports/results.xml sources/test_calc.py'
//             }
//             post {
//                 always {
//                     junit 'test-reports/results.xml'
//                 }
//             }
//         }
//         stage('Deploy') {
//             steps {
//                 sh 'docker run -v "$(pwd)/sources:/src/" cdrx/pyinstaller-linux:latest "pyinstaller --onefile add2vals.py"'
//             }
//             post {
//                 success {
//                     archiveArtifacts 'sources/dist/add2vals'
//                 }
//             }
//          }
        }
     }