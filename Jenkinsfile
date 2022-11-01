pipeline {
    agent any
    
    parameters {
        choice (name: 'action',
				choices: ['plan','apply','destroy'],
				description: 'Terraform plan, apply, destroy command')
		choice (name: 'workspace',
				choices: ['prod','testing'],
				description: 'Select a terraform workspace to apply ')
    }
    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/mashish1709/jenkins']]])
            }
        }
        stage ("terraform init") {
            steps {
                sh ("terraform init -reconfigure") 
            }
        }
        stage ("terraform workspace"){
            steps{
                sh ("terraform workspace select ${workspace} ")
                echo "Terraform selected workspace is --> ${workspace}"
            }
        }
        
        
        stage ("plan") {
            steps {
                sh ('terraform plan') 
            }
        }
        stage (" Action") {
            steps {
                echo "Terraform action is --> ${action}"
                sh ('terraform ${action} --auto-approve') 
           }
        }
    }
}