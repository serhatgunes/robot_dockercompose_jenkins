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
		cmd_exec('docker exec -it test-execution bash')
        cmd_exec('robot -v browser:Chrome test/webui_demo.robot')
    }

    stage('Docker Teardown') {
        parallel(
          "Stop Compose": {
    		/* Tear down docker compose */
            cmd_exec('docker-compose down --rmi local')
          }
        )
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