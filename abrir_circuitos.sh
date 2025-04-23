#!/bin/bash

# Verifica se o argumento foi passado
if [ -z "$1" ]; then
  echo "Uso: $0 caminho/para/pasta"
  exit 1
fi

PASTA="$1"

# Encontra todos os diretórios, em ordem alfabética
find "$PASTA" -type d | sort | while read -r dir; do
  # Encontra o primeiro arquivo .circ no diretório atual, se houver
  circuito=$(find "$dir" -maxdepth 1 -type f -name "*.circ" | sort | head -n 1)

  if [ -n "$circuito" ]; then
    echo "Abrindo $circuito..."
    java -jar logisim-evolution-3.9.0-all.jar "$circuito"
    echo "Circuito fechado, indo para o próximo..."
  fi
done

echo "Todos os circuitos foram abertos!"
