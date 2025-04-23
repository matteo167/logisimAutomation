#!/bin/bash

# Verifica se o argumento foi passado
if [ -z "$1" ]; then
  echo "Uso: $0 caminho/para/pasta"
  exit 1
fi

PASTA="$1"

find "$PASTA" -maxdepth 1 -name "*.circ" | sort | while read -r circuito; do
  echo "Abrindo $circuito..."
  java -jar logisim-evolution-3.9.0-all.jar "$circuito"
  echo "Circuito fechado, indo para o próximo..."
done

echo "Todos os circuitos foram abertos!"