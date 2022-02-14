#!/bin/bash

file="utils.sh"


# TODO -c "Escrever documentação" -t DOCUMENTACAO
# monta um link para download de um arquivo
# caso caso não sejam especificados os parâmetros
# facultativos monta um link padrão
# PARÂMETRO OBRIGATÓRIO: Nome do arquivo (-f)
# PARÂMETRO TIPO: quando informado C realizar via curl (unico arquivo)
#                 quando informado G realizar clone de repositório 
# PARÂMETRO PROTOCOLO: quando informado S realizar clones via SSH
#                      quando informado H realizar clones via HTTPS

user="MarciovsRocha"
repo="public-scripts"
branch="master"
tipo=c
protocolo="ssh"
file="None"

echo "Montando url para arquivo(s)..."

while getopts f:h:u:r:b:t:p: flag; do
    case "${flag}" in
        f) 
            file=${OPTARG}
            ;;
        h)
            header=${OPTARG}
            ;;
        u)
            user=${OPTARG}
            ;;
        r)
            repo=${OPTARG}
            ;;
        b)
            branch=${OPTARG}
            ;;
        t)
            tipo=${OPTARG}
            ;;
        p)
            protocolo=${OPTARG}
            ;;
        *)
            echo "Parâmetro '${flag}' inválido."
            exit 1
            ;;
    esac
done

baixar(){
    if [ c = "$tipo" ] ; then
        if [ -z "$header" ] ; then 
            header="https://raw.githubusercontent.com" ;
        fi

        if [ -z "$file" ] || [ "None" = "$file" ] ; then
            echo "Arquivo para download não especificado"
            return 1
        fi

        echo "Baixando arquivo..."    
        curl -o file "$header/$user/$repo/$branch/$file" && return 0 || return 1
    elif [ g = "$tipo" ] ; then
        echo "Baixando arquivos..."
        case "${protocolo}" in
            s)
                header="git@github:"
                ;;
            h)
                header="https://github.com/"
                ;;
            *)
                echo "Protocolo inválido."
                exit 1
                ;;
        esac

        if [ -z "$branch" ] ; then 
            git clone "${header}${user}/${repo}.git" && return 0 || return 1
        else 
            git clone -b "${branch}" "${header}${user}/${repo}.git" && return 0 || return 1
        fi
    fi
}

baixar && echo "Arquivo(s) baixado(s) com sucesso." || echo "Falha ao baixar arquivo(s)."
