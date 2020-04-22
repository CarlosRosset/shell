#!/bin/bash

#----------------------------------------------------------
function verificaPacoteDialog() {
    # sudo apt-get install dialog
    pacote=$(dpkg --get-selections | grep "dialog" )
    sleep 2
    if [ -n "$pacote" ] ;
    then echo
         echo "Pacote $nome ja instalado"
    else echo
         echo "Pacote $nome Necessario-> Nao instalado"
         echo "Instalando Automaticamente Pacote Dialog..."
         sudo apt-get install $nome
    fi    
}
#----------------------------------------------------------

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

verificaPacoteDialog
apresentacao 5

