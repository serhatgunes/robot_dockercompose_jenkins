# Robot_DockerCompose

**To stop all Docker containers, simply run the following command in your terminal:**
> docker-compose -f docker-compose_base.yml up -d
> 
> docker exec -it ipp-robottest_robot-test_1 bash
> 
> root@613528631ffb:/tmp/robot_dockercompose# robot -v browser:Chrome test/webui_demo.robot
> 
**Stop all containers:** 
> docker kill $(docker ps -q)
> 
**Remove all containers:**
> docker rm $(docker ps -a -q)
> 
**Remove all docker images:**
> docker rmi $(docker images -q) --force
> 
**Run tests in parallel:**
> pabot --pabotlib --processes 2 --argumentfile1 Firefox.args --argumentfile2 Chrome.args  test/ui_tests.robot
