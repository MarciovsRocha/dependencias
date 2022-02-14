# Dependências 

by: dev.marcio.rocha@gmail.com
date: 02/2022

Este projeto é um facilitador para instaladores, basta passar os parâmetros para o `dependencias.sh` que este irá baixar o(s) arquivo(s) desejado.


## Parâmetros

Os parâmetros que podem ser indicados para este script servem para *montar a URL* em questão, *definir a maneira* que será utilizada para baixar o(s) arquivo(s), *especificar a branch* de origem do arquivo e *definir o protocolo* a ser utilizado (se aplicável).

exemplos de URL's suportadas:
* `git@github:username/repo.git` *(Baixar um repositório)*
* `https://github.com/username/repo.git` *(Baixar um repositório)*
* `https://raw.githubusercontent.com/user/repo/branch/arquivo` *(Baixar um único arquivo de um repositório)*

Padrões caso não sejam informados os parâmetros:

    user = MarciovsRocha
    repo = public-scripts
    branch = master
    tipo = CURL
    protocolo = SSH (caso o tipo seja via GIT)

### Header

O parâmetro *header* serve para indicar o *"cabeçalho"* da URL, utilize a *flag* `-h`. Note que o "cabeçalho" possui o *conector* para o próximo parâmetro. Caso não seja especifiado o cabeçalho serão utilizados os padrões pré-definidos para cada ocasião.

Exemplos de cabeçalhos: 

* `git@github:` *(conector **":"**)*
* `https://github.com/` *(conector **"/"**)*
* `https://raw.githubusercontent.com/` *(conector **"/"**)*

### Usuário 

O parâmetro *usuário* serve para indicar o dono do repositório em questão, utilize a *flag* `-u`. Note que este parâmetro diferente do *Header* **não** utiliza um conector ao final.

### Repositório

O parâmetro *"repositório"* serve para indicar qual repositório utilizar para realizar o [clone || download] do(s) arquivos, utilize a *flag* `-r`. Note que este parâmetro diferente do *Header* **não** utiliza um conector ao final.

### Branch

O parâmetro *"branch"* serve para indicar de qual branch do repositório em questão será utilizada, utilize a *flag* `-b`. Note que este parâmetro diferente do *Header* **não** utiliza um conector ao final.
