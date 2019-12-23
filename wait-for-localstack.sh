# while $(docker ps -q); do
#   echo 'waiting for container to start..'
#   sleep 1
# done

echo "waiting for S3.."
until $(nc -zv localhost 4572); do
    printf '.'
    sleep 1
done
echo "waiting for IAM.."
until $(nc -zv localhost 4593); do
    printf '.'
    sleep 1
done
echo "waiting for Lambda.."
until $(nc -zv localhost 4574); do
    printf '.'
    sleep 1
done

# CONTAINER=$(docker ps -q)
# echo "waiting for Localstack to report 'Ready.' from container $CONTAINER"

# while true; do
#   LOGS=$(docker logs $CONTAINER --since 1m)
#   if echo $LOGS | grep 'Ready.'; then
#     echo "Localstack is ready!"
#     break;
#   fi
#   echo "waiting.."
#   sleep 1
# done

sleep 2