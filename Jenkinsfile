pipeline {
    agent any

    stages {

        stage('Checkout') {  // renamed from "Check the code"
            steps {
                checkout([$class: 'GitSCM',
                    branches: [[name: '*/master']],
                    userRemoteConfigs: [[
                        url: 'git@github.com:sagar12345raikwar-stack/Skillfyme-Projects-Practices.git',
                        credentialsId: 'jenkinskey' // use  SSH credential ID here
                    ]]
                ])
            }
        }

        stage('Build the Code') {
            steps {
                echo 'Building application...'
            }
        }

        stage('Test') {
            steps {
                echo 'It is Testing part of our code...'
            }
        }

        stage('Code Quality Check') {
            steps {
                echo 'It is checking code quality...'
            }
        }
    }

    post {
        success {
            echo 'CI Pipeline Successful'
        }
        failure {
            echo 'CI Pipeline Failed'
        }
    }
}

