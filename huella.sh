#!/bin/bash

# Colores
RED='\033[0;31m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
DIM='\033[2m'
RESET='\033[0m'
BOLD='\033[1m'

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

# Función para estática
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

clear
sleep 0.5

# Estática inicial
static 3
sleep 0.3

clear
sleep 0.4

# Sintonizando
printf "${DIM}"
type_text ".........................................." 0.02
sleep 0.2
type_text "......... sintonizando ................." 0.03
sleep 0.3
type_text ".........................................." 0.02
sleep 0.5

clear
sleep 0.6

# Texto de llegada
printf "${WHITE}"
type_text "alguien dejó esto aquí." 0.06
sleep 0.8
type_text "para ti." 0.09
sleep 1.2

printf "${DIM}"
type_text "o quizás ya estaba." 0.06
sleep 1.5

clear
sleep 0.8

# La pregunta
printf "${WHITE}"
type_text "antes de continuar." 0.07
sleep 0.6
echo
printf "${CYAN}"
type_text "¿cómo te llamas?" 0.08
sleep 0.4
echo
printf "${WHITE}> ${RESET}"
read nombre
echo

sleep 0.5

# Respuesta personalizada según nombre (siempre diferente, nunca juzga)
len=${#nombre}
if [ $len -le 4 ]; then
    response="un nombre corto. como una habitación pequeña."
elif [ $len -le 7 ]; then
    response="$nombre. lo voy a recordar un momento y luego olvidar."
else
    response="$nombre. demasiadas letras para una sola persona."
fi

clear
sleep 0.3

printf "${DIM}"
type_text "$response" 0.05
sleep 1.2

printf "${WHITE}"
type_text "hay algo que quiero darte." 0.06
sleep 0.8

printf "${DIM}"
type_text "no sé si lo querrás." 0.05
sleep 0.6
type_text "tampoco importa demasiado." 0.05
sleep 1.5

clear
sleep 0.5

# El laberinto — instrucción críptica
printf "${WHITE}"
type_text "para llegar necesitas hacer una cosa." 0.05
sleep 0.8
echo
printf "${CYAN}"
type_text "escribe:  aceptar" 0.07
echo
sleep 0.3
printf "${WHITE}> ${RESET}"
read respuesta

echo
sleep 0.4

# Acepta cualquier variante
respuesta_lower=$(echo "$respuesta" | tr '[:upper:]' '[:lower:]' | tr -d ' ')

if [[ "$respuesta_lower" == "aceptar" || "$respuesta_lower" == "acepto" || "$respuesta_lower" == "si" || "$respuesta_lower" == "sí" || "$respuesta_lower" == "yes" || "$respuesta_lower" == "ok" ]]; then
    clear
    sleep 0.3
    printf "${WHITE}"
    type_text "bien." 0.1
    sleep 0.6
    type_text "abriendo." 0.09
    sleep 0.3
    printf "${DIM}"
    for i in 1 2 3; do
        printf "."
        sleep 0.4
    done
    echo
    sleep 0.5

    # Abrir la imagen en el navegador
    if command -v open &> /dev/null; then
        open "https://raw.githubusercontent.com/samuelgaliano/huella/main/imagen.jpg"
    elif command -v xdg-open &> /dev/null; then
        xdg-open "https://raw.githubusercontent.com/samuelgaliano/huella/main/imagen.jpg"
    fi

    sleep 1
    clear
    printf "${DIM}"
    type_text "regalas algo" 0.06
    sleep 0.4
    type_text "y sigues teniéndolo." 0.06
    sleep 0.8
    type_text "eso es lo raro." 0.07
    sleep 1.5
    echo
    printf "${WHITE}"
    type_text "— samuel galiano" 0.05
    sleep 0.3
    printf "${RESET}"
    echo
    echo

else
    clear
    sleep 0.3
    printf "${DIM}"
    type_text "entendido." 0.07
    sleep 0.8
    type_text "la imagen sigue ahí." 0.06
    sleep 0.6
    type_text "por si cambias de opinión:" 0.05
    sleep 0.4
    echo
    printf "${CYAN}"
    type_text "https://raw.githubusercontent.com/samuelgaliano/huella/main/imagen.jpg" 0.02
    printf "${RESET}"
    echo
    echo
fi
