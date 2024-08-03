pipeline {
    agent any

    stages {
        stage('Setup Python Virtual ENV for dependencies') {
            steps {
                sh 'chmod +x envsetup.sh'
                sh './envsetup.sh'
            }
        }
        stage('Setup Gunicorn Setup') {
            steps {
                sh 'chmod +x gunicorn.sh'
                sh './gunicorn.sh'
            }
        }
        stage('Setup NGINX') {
            steps {
                sh 'chmod +x nginx.sh'
                sh './nginx.sh'
            }
        }
    }
}
