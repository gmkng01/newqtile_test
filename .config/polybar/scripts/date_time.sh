#!/usr/bin/bash

get_date_time (){
    TIME=$(date "+%H:%M")
    DATE=$(date "+%d, %b %y")
    echo -e -n " ${DATE} - $TIME "
}

get_date_time