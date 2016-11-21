#!/bin/bash
OPERATION=$1
PROJECT_NAME="http4sbin-learning-docker"

if [ $OPERATION = "start" ]; then
  docker run \
    -v $(pwd):/app \
    -v ~/.ivy2:/root/.ivy2 \
    -v ~/.sbt:/root/.sbt \
    -p 127.0.0.1:8080:8080 \
    --rm \
    --workdir /app \
    --name $PROJECT_NAME \
    imageintelligence/scala sbt run
elif [ $OPERATION = "dev" ]; then
  docker run \
    -v $(pwd):/app \
    -v ~/.ivy2:/root/.ivy2 \
    -v ~/.sbt:/root/.sbt \
    -p 127.0.0.1:8080:8080 \
    -t -i \
    --rm \
    --workdir /app \
    --name $PROJECT_NAME \
    imageintelligence/scala /bin/bash
elif [ $OPERATION = "stop" ]; then
  docker stop $PROJECT_NAME
elif [ $OPERATION = "restart" ]; then
  docker restart $PROJECT_NAME
else
  echo "unknown operation: $OPERATION"
fi
