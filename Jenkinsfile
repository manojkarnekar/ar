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

		stage('add_docker_2_grp') {

			steps {
				sh 'sudo groupadd docker'
				sh 'sudo usermod -aG docker ${USER}'
				sh 'su -s ${USER}'
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