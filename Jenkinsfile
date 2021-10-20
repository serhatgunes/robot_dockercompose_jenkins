 /* This pipeline creates a docker compose and then executes all the scripts. Note the Jenkins has to be in Linux environment */
node {
    timestamps {
    def app

    stage('Clone repository') {
        /* Clone repository */
        checkout scm
    }

    stage('Docker Up Containers') {
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

    stage('Execute Robot Tests With Parallel') {
		/* Execute the script. On faliure proceed to next step */
        catchError(buildResult: 'FAILURE', stageResult: 'FAILURE') {

       if (isUnix()) {
                /* sh './wait-for-grid.sh && docker exec test-execution robot --outputdir ./reports -v browser:Chrome test/ui_tests.robot' */
                sh './wait-for-grid.sh && docker exec test-execution pabot --pabotlib --processes 2 --verbose --argumentfile1 Firefox.args --argumentfile2 Chrome.args --outputdir ./reports  --listener robotframework_reportportal.listener --variable RP_UUID:"a21dd06e-c444-43ac-8dcd-b0456e09a974" --variable RP_ENDPOINT:"http://172.19.0.1:8080" --variable RP_LAUNCH:"default_TEST_EXAMPLE" --variable RP_PROJECT:"default_personal" test/ui_tests.robot'
            }
        else {
                bat './wait-for-grid.sh && docker exec test-execution robot --outputdir ./reports -v browser:Chrome test/ui_tests.robot'
            }
        }
    }

  try {
      stage('Report Robot Results') {
         echo "R ${currentBuild.result} C ${currentBuild.currentResult}"
         step([
            $class : 'RobotPublisher',
            outputPath : './reports/',
            outputFileName : "*.xml",
            disableArchiveOutput : false,
            passThreshold : 100,
            unstableThreshold: 95.0,
            otherFiles : "selenium-screenshot*.png,*/report-.csv",
          ])
       }
       echo "R ${currentBuild.result} C ${currentBuild.currentResult}"
    } catch (e) {
       throw(e)
    } finally {
    }

    stage('Docker Down Containers and Remove Test Execution Image') {
        parallel(
          "Stop Compose": {
    		/* Tear down docker compose */
            cmd_exec('docker-compose -f docker-compose.yml stop && docker-compose -f docker-compose.yml kill')
          },
          "Remove Image": {
            /* Delete test-execution image which got created earlier */
            cmd_exec('docker rmi test-execution --force')
          }
        )
        }
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