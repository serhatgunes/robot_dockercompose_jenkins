pipeline {
    environment {
    registry = "sudheshpn/calculator"
    registryCredential = 'dockerhub'
    PATH = "$PATH:/usr/bin"
    dockerImage = ''
  }

        stage("Deploy to staging") {
              steps {
                    echo "PATH is: $PATH"
                    sh "/usr/bin/docker-compose up --build -d"
               }
        }