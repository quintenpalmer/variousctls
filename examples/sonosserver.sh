while true ; do
    echo -e 'HTTP/1.1 200 OK\n\r\n\r<NewVolume>50</NewVolume>\n\r\n\r' | nc -l -N 1400 ;
done
