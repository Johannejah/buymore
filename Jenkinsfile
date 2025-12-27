pipeline {
    agent any 

    // Define environment variables if needed
    environment {
        APP_NAME = 'buymore-web-app'
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Pulling code from GitHub...'
                // Jenkins automatically handles this if you use "Pipeline from SCM"
            }
        }

        stage('Build') {
            steps {
                echo "Building ${env.APP_NAME}..."
                // Example: sh 'npm install' or 'python -m pip install -r requirements.txt'
            }
        }

        stage('Test') {
            steps {
                echo 'Running Unit Tests...'
                // Example: sh 'pytest'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying to Local Web Server...'
                // In your WSL, this might be copying to /var/www/html
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished execution.'
        }
        success {
            echo 'Deployment successful! Check the app at http://localhost'
        }
        failure {
            echo 'Build failed. Please check the Jenkins Console Output.'
        }
    }
}