node {
	def app
	def image = 'registry.hub.docker.com/ravikirankiran097/ecosystem-user-service'
	def branch = '0.2.7-devops-work'
	
	try {
		stage('Clone Repository') {               
	    	git branch: branch,
	        	credentialsId: 'GitHub_Cred',
	        	url: 'https://github.com/ravikirankiran097/ecosystem-user-service.git'
	    } 
	
		stage('Build JAR') {
	    	docker.image('maven:3.6.3-jdk-11').inside('-v /root/.m2:/root/.m2') {
	        	sh 'mvn -B clean package'
	        	stash includes: '**/target/ecosystem-user-service.jar', name: 'jar'
	    	}
	    }
	     
//	    stage('Build Image') {
//	    	unstash 'jar'
//			app = docker.build image + ':$BUILD_NUMBER'
//	    }
//	    
//	    stage('Push to DockerHub') {
//	    	docker.withRegistry('https://registry.hub.docker.com', 'DockerHub_Cred') {            
//				app.push()
//	        }    
//	    }
//	    
//	    stage('Cleanup') {
//			sh 'docker rmi ' + image + ':$BUILD_NUMBER'
//	    }
//	} catch (e) {
//		echo 'Error occurred during build process!'
//		echo e.toString()
//		currentBuild.result = 'FAILURE'
//	} finally {
//        junit '**/target/surefire-reports/TEST-*.xml'		
//	}
}
