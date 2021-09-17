 /* This pipeline creates a docker compose and then executes all the scripts. Note the Jenkins has to be in Linux environment */
node {
    def app

    stage('Clone repository') {
        /* Clone repository */
        checkout scm
    }

    stage('Docker Setup') {
        parallel(
          "Start Compose": {
    		/* Start docker-compose with five instances of Chrome */
    	    cmd_exec('docker-compose -f docker-compose.yml up -d')
          }
        )
    }

    stage('Execute') {
		/* Execute the pytest script. On faliure proceed to next step */
        catchError(buildResult: 'FAILURE', stageResult: 'FAILURE') {

       if (isUnix()) {
                sh 'docker exec test-execution robot --variable browser:Chrome test/webui_demo.robot'
            }
        else {
                /* Make sure you have shared the folder and set full permissions for this folder "%WORKSPACE%\\allure-results"*/
                bat 'docker exec test-execution robot --variable browser:Chrome test/webui_demo.robot'
            }
        }
    }

    stage('Docker Teardown') {
        parallel(
          "Stop Compose": {
    		/* Tear down docker compose */
            cmd_exec('docker-compose down --rmi local')
          },
          "Remove Image": {
            /* Delete the image which got created earlier */
            cmd_exec('docker rmi test-execution -f')
          }
        )
    }

    stage('Create Report') {
        /* Generate Allure Report */
        allure includeProperties: false, jdk: '', results: [[path: 'allure-results']]
    }

}

def cmd_exec(command) {
    if (isUnix()) {
        return sh(returnStdout: true, script: "${command}").trim()
    }
    else {
        return bat(returnStdout: true, script: "${command}").trim()
    }
}