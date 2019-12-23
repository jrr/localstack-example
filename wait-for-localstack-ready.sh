CONTAINER=$(docker ps -q)
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