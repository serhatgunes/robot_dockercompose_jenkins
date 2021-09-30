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
                /* sh './wait-for-grid.sh && docker exec test-execution robot --outputdir ./reports -v browser:Chrome test/ui_tests.robot' */
                sh './wait-for-grid.sh && docker exec test-execution pabot --pabotlib --processes 2 --argumentfile1 Firefox.args --argumentfile2 Chrome.args --outputdir ./reports  test/ui_tests.robot'
            }
        else {
                bat './wait-for-grid.sh && docker exec test-execution robot --outputdir ./reports -v browser:Chrome test/ui_tests.robot'
            }
        }
    }

  try {
      stage('Test myapp') {
         echo "R ${currentBuild.result} C ${currentBuild.currentResult}"
         step([
            $class : 'RobotPublisher',
            outputPath : './reports/',
            outputFileName : "*.xml",
            disableArchiveOutput : false,
            passThreshold : 100,
            unstableThreshold: 95.0,
            otherFiles : "*/selenium-screenshot.png,*/report-.csv",
          ])
       }
       echo "R ${currentBuild.result} C ${currentBuild.currentResult}"
    } catch (e) {
       throw(e)
    } finally {
    }

    stage('Docker Teardown') {
        parallel(
          "Stop Compose": {
    		/* Tear down docker compose */
            cmd_exec('docker kill $(docker ps -q) && sleep 1s && docker rm $(docker ps -a -q)')
          },
          "Remove Image": {
            /* Delete test-execution image which got created earlier */
            cmd_exec('docker rmi test-execution --force')
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