CONTAINER=$(docker ps -q)

if [ -z $CONTAINER ]; then
    echo "Couldn't find running Docker container."
    docker --version
    docker ps
    exit 1
fi

echo "waiting for Localstack to report 'Ready.' from container $CONTAINER"

while true; do
  LOGS=$(docker logs $CONTAINER --since 1m)
  if echo $LOGS | grep 'Ready.'; then
    echo "Localstack is ready!"
    break;
  fi
  echo "waiting.."
  sleep 1
done