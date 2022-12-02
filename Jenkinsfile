pipeline 
{   
  agent any  
  tools{ maven "M3"}
  environment 
  {     
    DOCKERHUB_CREDENTIALS= credentials('DockerHub_Cred')     
  }    
  stages 
  {         
    stage("Git Checkout")
	{           
		steps
		{                
		git branch: '0.2.7-devops-work', credentialsId: 'GitHub_Cred', url: 'https://github.com/ravikirankiran097/ecosystem-user-service.git'                 
		echo 'Git Checkout Completed'            
		}        
    }
	
	stage("Mvn Build")
	{           
		steps
		{ 
		sh 'mvn -Dmaven.test.failure.ignore=true clean install'                
		echo 'Mvn Build Completed'            
		}        
    }
	
    stage('Build Docker Image') 
	{         
		steps
		{                
		sh 'docker build -t ravikirankiran097/ecosystem-user-service:$BUILD_NUMBER .'           
        	echo 'Build Image Completed'                
		}           
    }
    stage('Login to Docker Hub') 
	{         
		steps
		{                            
		withCredentials([usernamePassword(credentialsId: 'DockerHub_Cred', passwordVariable: 'DockerHub_CredPassword', usernameVariable: 'DockerHub_CredUser')]) 
			{
        		sh "docker login -u ${env.DockerHub_CredUser} -p ${env.DockerHub_CredPassword}"
			sh "docker tag ravikirankiran097/ecosystem-user-service:latest ravikirankiran097/ecosystem-user-service:latest"
          		sh 'docker push ravikirankiran097/ecosystem-user-service:latest'        
			}
		echo 'Login Completed'                
		}           
    }               
    stage('Push Image to Docker Hub') 
	{         
		steps
		{                            
		sh 'sudo docker push ravikirankiran097/ecosystem-user-service:$BUILD_NUMBER'                 
		echo 'Push Image Completed'       
		}           
    }      
  } 
  
//stages
 
  post
  {
	always 
	{  
		sh 'docker logout'           
    }      
  }  
} 

//pipeline
