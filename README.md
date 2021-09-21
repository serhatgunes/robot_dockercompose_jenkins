# Robot_DockerCompose

**To stop all Docker containers, simply run the following command in your terminal:**
> docker-compose -f docker-compose_base.yml up -d
> 
> docker exec -it ipp-robottest_robot-test_1 bash
> 
> root@613528631ffb:/tmp/robot_dockercompose# robot -v browser:Chrome test/webui_demo.robot
> 
> docker kill $(docker ps -q)
> 
> docker rm $(docker ps -a -q)
> 
> docker rmi $(docker images -q) --force
> 
> 
> 