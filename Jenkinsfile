pipeline 
{   
  agent any  
  environment 
  {     
    DOCKERHUB_CREDENTIALS= credentials('dockerhubcredentials')     
  }    
  stages 
  {         
    stage("Git Checkout")
	{           
		steps
		{                
		git credentialsId: 'GitHub Credentials', url: 'https://github.com/ravikirankiran097/ecosystem-user-service.git'                 
		echo 'Git Checkout Completed'            
		}        
    }
    stage('Build Docker Image') 
	{         
		steps
		{                
		sh 'sudo docker build -t dockerhubusername/dockerhubreponame:$BUILD_NUMBER .'           
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
		sh 'sudo docker push dockerhubusername/dockerhubreponame:$BUILD_NUMBER'                 
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
