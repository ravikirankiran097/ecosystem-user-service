node {
	def app
	def image = 'ravikirankiran097/unit-test'
	def branch = scm.branches[0].name.substring(2)
	
	try {
		stage('Clone repository') {
	    	git branch: branch,
	        	credentialsId: 'GitHub_Cred',
	        	url: 'https://github.com/ravikirankiran097/ecosystem-user-service.git'
	    } 
	
		stage('Build JAR') {
	    	docker.image('maven:3.6.3-jdk-11').inside('-v /root/.m2:/root/.m2') {
	        	sh 'mvn -B -Dmaven.test.skip=true clean package'
	        	stash includes: '**/target/ecosystem-user-service.jar', name: 'jar'
	    	}
	    }
	     
	    stage('Build Image') {
	    	unstash 'jar'
			app = docker.build image + ':$BUILD_NUMBER'
	    }
	    
	    stage('Push') {
	    	docker.withRegistry('https://registry.hub.docker.com', 'DockerHub_Cred') {            
				app.push()
	        }    
	    }
	    
	    stage('Cleanup') {
	
			sh 'docker rmi ' + image + ':$BUILD_NUMBER'
			sh 'docker rmi registry.hub.docker.com/' + image + ':$BUILD_NUMBER'
	    }
	} catch (e) {
		echo 'Error occurred during build process!'
		echo e.toString()
		currentBuild.result = 'FAILURE'
	} finally {
		//skipping tests as we need environment setup (e.g., remote properties files)
		//will get to it later
        //junit '**/target/surefire-reports/TEST-*.xml'		
	}
}
