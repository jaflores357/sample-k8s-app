status="fail"
for i in $(seq 1 10);do 
    retcode=$(curl -o /dev/null -s -w "%{http_code}" www.asddde.com)
    if [ $retcode -eq 200 ]; then 
        status="success"
        break 
    fi
    sleep 2
done
echo $status
