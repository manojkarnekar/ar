pipeline{

	agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('docker-jenkins-auto')
	}

	stages {

		stage('Build') {

			steps {
				sh 'sudo docker build -t manojkarnekar/noetic:latest .'
			}
		}

		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'sudo docker push manojkarnekar/noetic:latest'
			}
		}
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}