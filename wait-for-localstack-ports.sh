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