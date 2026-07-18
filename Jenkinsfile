pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('App') {
            steps {
                sh 'chmod +x app.sh test.sh build.sh'
                sh './app.sh'
            }
        }

        stage('Test') {
            steps {
                sh './test.sh'
            }
        }

        stage('Build') {
            steps {
                sh './build.sh'
            }
        }

	stage('Use Secret') {
		steps {
			withCredentials([string(credentialsId: 'demo-api-key', variable: 'API_KEY')]) {
				sh '''
					echo "Using API key to call fake service..."
					echo "Key starts with: ${API_KEY:0:6}****"
				   '''
				}
			}
		}
    }

    post {
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed!'
        }
        always {
            echo 'Pipeline finished.'
        }
    }
}
