
#!/bin/sh
# shell script to prepend i3status with more stuff

i3status | while :
do
    read line
    tweet=$(/home/jason/.gem/ruby/2.2.0/bin/t timeline | head -n4 | tr '\n' ' - ')
    echo "$tweet | $line" || exit 1
done
