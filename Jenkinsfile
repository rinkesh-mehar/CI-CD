node {
	    // reference to maven
	    // ** NOTE: This 'maven-3.8.2' Maven tool must be configured in the Jenkins Global Configuration.
	    def mvnHome = tool 'mvn 3.8.4'

	    def dockerHome = tool 'mrdocker'

            env.PATH = "${dockerHome}/bin:${env.PATH}"


	    // holds reference to docker image
	    def dockerImage
	    // ip address of the docker private repository(nexus)

	    def dockerImageTag = "docker-cicd${env.BUILD_NUMBER}"

	    stage('Clone Repo') { // for display purposes
	      // Get some code from a GitHub repository
	      git 'https://github.com/rinkesh-mehar/CI-CD.git'
	      // Get the Maven tool.
	      // ** NOTE: This 'maven-3.8.2' Maven tool must be configured
	      // **       in the global configuration.
	      mvnHome = tool 'mvn 3.8.4'
	    }

	    stage('Build Project') {
	      // build project via maven
	      sh "'${mvnHome}/bin/mvn' clean install"
	    }

	    stage('Build Docker Image') {
	      // build docker image

// 	     sh "whoami"
//       		sh "ls -all /var/run/docker.sock"

// 	      sh "sudo service docker stop"

// 	      sh "sudo service docker start"

	      dockerImage = docker.build("docker-cicd:${env.BUILD_NUMBER}")
	    }

	    stage('Deploy Docker Image'){

	      // deploy docker image to nexus

	      echo "Docker Image Tag Name: ${dockerImageTag}"

		    sh "docker stop docker-cicd-api"

		  sh "docker rm docker-cicd-api"

		    sh "docker run --restart=always --name docker-cicd-api -d -p 9011:9011 docker-cicd:${env.BUILD_NUMBER}"

		  // docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
	      //    dockerImage.push("${env.BUILD_NUMBER}")
	      //      dockerImage.push("latest")
	      //  }

	    }
	}