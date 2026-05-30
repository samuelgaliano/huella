#!/bin/bash

# Colores
CYAN='\033[0;36m'
WHITE='\033[1;37m'
DIM='\033[2m'
NEON='\033[1;96m'
RESET='\033[0m'

# Función para escribir letra a letra
type_text() {
    text="$1"
    delay="${2:-0.04}"
    for ((i=0; i<${#text}; i++)); do
        printf "${text:$i:1}"
        sleep $delay
    done
    echo
}

# Función estática
static() {
    chars='░▒▓█▓▒░·∴∵⁚⁖'
    for i in $(seq 1 $1); do
        for j in $(seq 1 40); do
            idx=$((RANDOM % ${#chars}))
            printf "${DIM}${chars:$idx:1}${RESET}"
            sleep 0.005
        done
        echo
    done
}

# Función para abrir URL en navegador (Mac, Linux, Windows/Git Bash)
open_url() {
    url="$1"
    if command -v open &>/dev/null; then
        open "$url"
    elif command -v xdg-open &>/dev/null; then
        xdg-open "$url"
    elif command -v start &>/dev/null; then
        start "$url"
    else
        echo "$url"
    fi
}

clear
sleep 0.5

# Estática inicial
static 3
sleep 0.3
clear
sleep 0.4

# Pantalla 1
printf "${DIM}"
type_text ".........................................." 0.02
sleep 0.2
type_text "......... sintonizando ................." 0.03
sleep 0.3
type_text ".........................................." 0.02
sleep 0.8
clear
sleep 0.5

# Pantalla 2
printf "${WHITE}"
type_text "alguien dejó esto así." 0.06
sleep 0.5
type_text "Así de ordenadito." 0.06
sleep 0.4
type_text "Una cosa sobre la otra y al lado de la siguiente" 0.05
sleep 0.4
type_text "Solo para ti" 0.07
sleep 1.8
clear
sleep 0.5

# Pantalla 3 — nombre
printf "${WHITE}"
type_text "antes de continuar." 0.07
sleep 0.5
echo
type_text "¿cómo te llamas? Es importante conocer a quienes haces la cama" 0.05
sleep 0.4
echo
printf "${WHITE}> ${RESET}"
read nombre
echo
sleep 0.5

len=${#nombre}
if [ $len -le 4 ]; then
    response="$nombre. Las letras justas para una persona entera."
elif [ $len -le 7 ]; then
    response="$nombre. Lo voy a recordar un momento y luego olvidar."
else
    response="$nombre. Demasiadas letras para una sola persona."
fi

clear
sleep 0.3

# Pantalla 4
printf "${DIM}"
type_text "$response" 0.05
sleep 0.8
echo
printf "${WHITE}"
type_text "Te he puesto las sábanas lila y rosa palo." 0.05
sleep 0.4
type_text "no sé si te gustarán." 0.06
sleep 0.4
type_text "El papel de pared es el que hay." 0.06
sleep 2.0
clear
sleep 0.5

# Pantalla 5 — consentimiento
printf "${WHITE}"
type_text "El consentimiento puede ser algo delicado para con el contagio" 0.04
sleep 0.8
echo
printf "${CYAN}"
type_text "escribe:  aceptar" 0.06
echo
printf "${DIM}"
type_text "o" 0.1
echo
printf "${CYAN}"
type_text "escribe:  denegar" 0.06
echo
sleep 0.3
printf "${WHITE}> ${RESET}"
read respuesta
echo
sleep 0.4

respuesta_lower=$(echo "$respuesta" | tr '[:upper:]' '[:lower:]' | tr -d ' ')

if [[ "$respuesta_lower" == "denegar" || "$respuesta_lower" == "no" || "$respuesta_lower" == "negar" ]]; then
    clear
    sleep 0.3
    printf "${DIM}"
    type_text "denegando" 0.08
    sleep 0.6
    type_text "filtrando" 0.08
    sleep 0.6
    type_text "higienizando" 0.07
    sleep 1.2
    printf "${RESET}"
    echo
    exit 0
fi

# Aceptó
clear
sleep 0.3
printf "${DIM}"
type_text "bien." 0.1
sleep 0.6
type_text "abriendo." 0.09
for i in 1 2 3; do
    printf "."
    sleep 0.4
done
echo
sleep 0.8

open_url "https://raw.githubusercontent.com/samuelgaliano/huella/main/imagen-2.jpg"

sleep 1.0
clear

echo
printf "${NEON}"
type_text "?cómo regalar el contagio?" 0.07
printf "${RESET}"
echo
echo

