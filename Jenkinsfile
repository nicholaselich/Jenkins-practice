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

	stage('Build Image') {
		steps {
			sh 'docker build -t nel1ch/jenkins-practice:${BUILD_NUMBER} .'
		}
	}

	stage('Use Secret') {
		steps {
			withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
				sh '''#!/bin/bash
					echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
					docker push nel1ch/jenkins-practice:${BUILD_NUMBER}
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
