#!/bin/bash

#----------------------------------------------------------
function verificaPacoteDialog() {
    sudo apt-get install dialog
    sudo apt-get install jq
    # pacote=$(dpkg --get-selections | grep "dialog" )
    # sleep 2
    # if [ -n "$pacote" ] ;
    # then echo
    #      echo "Pacote $nome ja instalado"
    # else echo
    #      echo "Pacote $nome Necessario-> Nao instalado"
    #      echo "Instalando Automaticamente Pacote Dialog..."
    #      sudo apt-get install $nome
    # fi    

    # pacote=$(dpkg --get-selections | grep "jq" )
    # sleep 2
    # if [ -n "$pacote" ] ;
    # then echo
    #      echo "Pacote $nome ja instalado"
    # else echo
    #      echo "Pacote $nome Necessario-> Nao instalado"
    #      echo "Instalando Automaticamente Pacote JQ..."
    #      sudo apt-get install $nome
    # fi    
}
#----------------------------------------------------------

function getIdToken(){
idToken=$(curl --location --request POST 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBLUauRW0Q_QJGPzYjPOeQIAPsZKqNtIIY' \
--header 'Content-Type: application/json' \
--data-raw '{
	"email":"erp@serquip-al.com",
	"password":"serquip2020",
	"returnSecureToken": "true",
}'  | jq -r '.idToken')

echo "$idToken"    
}

#----------------------------------------------------------
function excluirAgendamentosRotasUsuariosERP(){
    rstDel1=$( curl --location --request DELETE 'https://serquip-al.firebaseio.com/app/agendamento/al/.json' )
    sleep 3
    rstDel2=$( curl --location --request DELETE 'https://serquip-al.firebaseio.com/erp/al/users/.json' )
    sleep 3
}
#----------------------------------------------------------

#----------------------------------------------------------
function inserirUsuariosERP(){
    rstPost1=$( curl --location --request PATCH 'https://serquip-al.firebaseio.com/erp/al/users/.json' \
    --header 'Content-Type: application/json' \
    --data-raw '{
        "UID_ERP_AL_CO01": {
            "cpf": 11111111111,
            "email": "condutor1@serquip.app",
            "fotoBase64": "hex",
            "funcao": "Condutor",
            "genero": "Masculino",
            "lastUpdate": 146123123694046,
            "nome": "Condutor 01",
            "protratamento": "Sr",
            "perfil": [
                "coletor"
            ]
        },
        "UID_ERP_AL_CO02": {
            "cpf": 22222222222,
            "email": "condutor2@serquip.app",
            "fotoBase64": "hex",
            "funcao": "Condutor",
            "genero": "Masculino",
            "lastUpdate": 146123123694046,
            "nome": "Condutor 02",
            "protratamento": "Sr",
            "perfil": [
                "coletor"
            ]
        },
        "UID_ERP_AL_CO03": {
            "cpf": 33333333333,
            "email": "condutor3@serquip.app",
            "fotoBase64": "hex",
            "funcao": "Condutor",
            "genero": "Masculino",
            "lastUpdate": 146123123694046,
            "nome": "Condutor 03",
            "protratamento": "Sr",
            "perfil": [
                "coletor"
            ]
        },
        "UID_ERP_AL_CL01": {
            "cpf": 11111111111,
            "email": "cliente1@serquip.app",
            "fotoBase64": "hex",
            "funcao": "Cliente",
            "genero": "Masculino",
            "lastUpdate": 146123123694046,
            "nome": "Cliente 01",
            "protratamento": "Sr",
            "perfil": [
                "cliente"
            ]
        },
        "UID_ERP_AL_CL02": {
            "cpf": 22222222222,
            "email": "cliente2@serquip.app",
            "fotoBase64": "hex",
            "funcao": "Cliente",
            "genero": "Masculino",
            "lastUpdate": 146123123694046,
            "nome": "Cliente 02",
            "protratamento": "Sr",
            "perfil": [
                "cliente"
            ]
        },
        "UID_ERP_AL_CL03": {
            "cpf": 33333333333,
            "email": "cliente3@serquip.app",
            "fotoBase64": "hex",
            "funcao": "Cliente",
            "genero": "Masculino",
            "lastUpdate": 146123123694046,
            "nome": "Cliente 03",
            "protratamento": "Sr",
            "perfil": [
                "cliente"
            ]
        },
        "UID_ERP_AL_ADM01": {
            "cpf": 11111111111,
            "email": "administrador@serquip.app",
            "fotoBase64": "hex",
            "funcao": "Administrador",
            "genero": "Masculino",
            "lastUpdate": 146123123694046,
            "nome": "Administrador 01",
            "protratamento": "Sr",
            "perfil": [
                "administrador",
                "cliente",
                "coletor"
            ]
        },    
        "UID_ERP_AL_RO01": {
            "cpf": 11111111111,
            "email": "root@serquip.app",
            "fotoBase64": "hex",
            "funcao": "Root",
            "genero": "Masculino",
            "lastUpdate": 146123123694046,
            "nome": "Root 01",
            "protratamento": "Sr",
            "perfil": [
                "administrador",
                "cliente",
                "coletor",
                "root",
                "vendedor"
            ]
        }       
    }' )
    
    sleep 4
}
#----------------------------------------------------------

#----------------------------------------------------------
function infoUsuariosCriados(){
    clear
    msg =""
    msg+="╔══════════════════════════════════════════════════════════╗ \n"
    msg+="║                   Usuarios Criados                       ║ \n"
    msg+="╠══════════════════════════════════════════════════════════╣ \n"
    msg+="║                                                          ║ \n"
    msg+="║        1. condutor1@serquip.app => 11111111111           ║ \n"
    msg+="║        2. condutor2@serquip.app => 22222222222           ║ \n"
    msg+="║        3. condutor3@serquip.app => 33333333333           ║ \n"
    msg+="║        4. cliente1@serquip.app => 11111111111            ║ \n"
    msg+="║        5. cliente2@serquip.app => 22222222222            ║ \n"
    msg+="║        6. cliente3@serquip.app => 33333333333            ║ \n"
    msg+="║        7. administrador@serquip.app => 11111111111       ║ \n"
    msg+="║        8. root@serquip.app => 11111111111                ║ \n"
    msg+="║                                                          ║ \n"    
    msg+="╚══════════════════════════════════════════════════════════╝ \n"
    dialog --backtitle "Carlos Rossset - carlosrosset@gmail.com" --infobox "${msg}" 16 64

}
#----------------------------------------------------------

verificaPacoteDialog
idToken=$(getIdToken)
excluirAgendamentosRotasUsuariosERP && inserirUsuariosERP && infoUsuariosCriados
echo "=========================="
echo "IdToken = $idToken"
echo "=========================="

