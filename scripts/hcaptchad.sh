#!/usr/bin/env bash
 
 
service="./hcaptchad -c ./hcaptchad.conf"
pid_file=hcaptchad.pid
 
 
function start() {
    ${service} &
    if [[ $? -eq 0 ]]; then
        echo $! > ${pid_file}
    else exit 1
    fi
}
 
 
function stop() {
    kill -9 $(cat ${pid_file})
    if [[ $? -eq 0 ]]; then
        rm -f ${pid_file}
    else exit 1
    fi
}
 
 
function call() {
    case $1 in
        'start')
            start
            ;;
        'stop')
            stop
            ;;
        *)
            echo 'Get invalid option, please input(as to $1):'
            echo -e '\t"start" -> start service'
            echo -e '\t"stop"  -> stop service'
			exit 1
    esac
}
 
 
call "$1"