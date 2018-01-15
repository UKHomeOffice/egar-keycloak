#/bin/sh
x=0
u=1
url="http://localhost:8090/auth/"
while [ "$u" -ne 0 ] && [ $x -le 60 ]; do
    (wget --spider $url 2>/dev/null)
    u=$?
    if [ "$u" -eq 0 ] ; then
        sleep 10 # Give keycloak time to finish booting, no way to test for this properly
    else
        sleep 5
        x=$((x+5))
    fi
done
if [ $u -ne 0 ]; then
    exit 1;
fi

echo "$url found in $x seconds"
