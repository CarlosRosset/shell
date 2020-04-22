#!/bin/bash

sudo apt-get install dialog

#----------------------------------------------------------
function apresentacao() {
    tms=$1
    if [ -z "${tms}" ]; then { tms=1; } fi
    clear
    msg =""
    msg+="╔══════════════════════════════════════════════════════════╗ \n"
    msg+="║                       Bem vindo                          ║ \n"
    msg+="╠══════════════════════════════════════════════════════════╣ \n"
    msg+="║                     ____   ____ _                        ║ \n"
    msg+="║                    |___ \ / ___| |                       ║ \n"
    msg+="║                      __) | |   | |                       ║ \n"
    msg+="║                     / __/| |___| |___                    ║ \n"
    msg+="║                    |_____|\____|_____|                   ║ \n"
    msg+="║                                                          ║ \n"
    msg+="╚══════════════════════════════════════════════════════════╝ \n"
    dialog --sleep ${tms} --backtitle "Carlos Rossset - carlosrosset@gmail.com" --infobox "${msg}" 12 64
    clear
}
#----------------------------------------------------------

apresentacao 5
