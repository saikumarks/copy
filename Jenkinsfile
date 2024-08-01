pipeline {
	agent any
	stages {
		stage('build') {
		 steps {
			echo 'Building........... '
			  sh "chmod +x copy.sh"
			sh './copy.sh'
		}
	 }
 }
}
