pipeline {

    agent any

    stages {

        stage('Check the code') {
            steps {
                git branch: 'master',
                    url: 'git@github.com:sagar12345raikwar-stack/Skillfyme-Projects-Practices.git'
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

