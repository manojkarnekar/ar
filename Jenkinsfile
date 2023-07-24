pipeline{

	agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('docker-jenkins-auto')
	}

	stages {

		stage('Build') {

			steps {
				sh 'sudo docker build -t latest .'
			}
		}

		stage('add_docker_2_grp') {

			steps {
				sh 'sudo usermod -a -G docker jenkins'
				sh 'grep docker /etc/group'
				sh 'sudo chmod 777 /var/run/docker.sock'
			}
		}

		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u manojkarnekar1 --password-stdin docker.io'
			}
		}

		stage('Push') {

			steps {
				sh 'sudo docker push docker.io/manojkarnekar1/octo:latest'
			}
		}
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}