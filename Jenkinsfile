pipeline{

	agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('docker-jenkins-auto')
	}

	stages {

		stage('Build') {

			steps {
				sh 'sudo docker build -t manojkarnekar1/noetic:latest .'
			}
		}

		stage('add_docker_2_grp') {

			steps {
				sh 'sudo usermod -a -G docker jenkins'
			}
		}

		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u manojkarnekar1 --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'sudo docker push manojkarnekar1/noetic:latest'
			}
		}
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}