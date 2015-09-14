docker build -t moddus/fit .

docker push moddus/fitr

./pc_cmd.sh 'docker run -d -p 22222:22 --privileged moddus/fit:latest'

./pc_cmd.sh 'docker pull moddus/fit:latest‚

docker exec -it <container-id>  bash
