pipeline {
   agent any
		
    stages {
    	stage('Build DSL Script') {
    		steps { 
			sh 'chmod 755 script.sh'
    			sh './script.sh'
    		}
    	}
    }
}
