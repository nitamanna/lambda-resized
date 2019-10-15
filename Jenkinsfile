pipeline {
   agent any
		
    scm {
        git {
            remote {
                url('https://github.com/nitamanna/lambda-resized.git')
                credentials('Github')
            }
            branch('master')
        }
    }
    stages {
    	stage('Build DSL Script') {
    		steps { 
    			sh './script.sh'
    		}
    	}
    }
}
