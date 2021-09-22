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
    		/* Start docker-compose */
    	    cmd_exec('docker-compose -f docker-compose.yml up -d')
          },
          "Build Image": {
            /* This builds an image with all robot selenium scripts in it */
    		/* cmd_exec('docker-compose -f docker-compose-robot_test.yml up -d') */
    		/* def dockerfile = 'robot_Dockerfile' */
            /* app = docker.build("test-execution","-f ${dockerfile} ./") */
          }
        )
    }

    stage('Execute') {
		/* Execute the script. On faliure proceed to next step */
        catchError(buildResult: 'FAILURE', stageResult: 'FAILURE') {

       if (isUnix()) {
                sh 'docker exec -it test-execution robot -v browser:Chrome test/webui_demo.robot'
            }
        else {
                /* Make sure you have shared the folder and set full permissions for this folder "%WORKSPACE%\\allure-results"*/
                bat 'docker run --network="host" test-execution robot -v browser:Chrome test/webui_demo.robot'
            }
        }
    }

    stage('Docker Teardown') {
        parallel(
          "Stop Compose": {
    		/* Tear down docker compose */
            cmd_exec('docker kill $(docker ps -q)')
            cmd_exec('docker rm $(docker ps -a -q)')
          },
          "Remove Image": {
            /* Delete the image which got created earlier */
            /* cmd_exec('docker rmi $(docker images -q) --force') */
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