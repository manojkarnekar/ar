pipeline{

	agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('docker-jenkins-auto')
	}

	stages {

		stage('Build') {

			steps {
				sh 'sudo docker build -t manojkarnekar1/octo:latest5 .'
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
				sh 'docker login'
				// sh 'sudo docker push manojkarnekar1/octo:latest1'
				script {
				echo "Pushing the image to docker hub"
				// def localImage = "${params.Image_Name}:${params.Image_Tag}"
				def repositoryName = "manojkarnekar1/octo:latest5"
				// sh "docker tag ${localImage} ${repositoryName} "
				// docker.withRegistry("", "DockerHubCredentials") {
				def image = docker.image("${repositoryName}");
				image.push()
         	// }
     		}
			}
		}
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}
