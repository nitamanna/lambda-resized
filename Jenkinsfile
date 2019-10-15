pipeline {
   agent any
		
    stages {
    	stage('Build DSL Script') {
    		steps { 
			chmod 755 script.sh
    			sh './script.sh'
    		}
    	}
    }
}
