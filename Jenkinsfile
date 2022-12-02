pipeline 
{   
  agent any  
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
		git credentialsId: 'GitHub_Cred', url: 'https://github.com/ravikirankiran097/ecosystem-user-service.git'                 
		echo 'Git Checkout Completed'            
		}        
    }
    stage('Build Docker Image') 
	{         
		steps
		{                
		sh 'sudo docker build -t ravikirankiran097/ecosystem-user-service:$BUILD_NUMBER .'           
        	echo 'Build Image Completed'                
		}           
    }
    stage('Login to Docker Hub') 
	{         
		steps
		{                            
		sh 'echo $DOCKERHUB_CREDENTIALS_PSW | sudo docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'                 
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
