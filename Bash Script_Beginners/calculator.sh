#!/bin/bash

add() {
    echo $(( $1 + $2 ))
}

subtract() {
    echo $(( $1 - $2 ))
}

multiply() {
    echo $(( $1 * $2 ))
}

divide() {
    if [ "$2" -eq 0 ]
    then
        echo "Error: Division by zero"
    else
        echo $(( $1 / $2 ))
    fi
}

modulus() {
    echo $(( $1 % $2 ))
}

while true
do
    echo "======= Calculator ======="
    read -p "Choose operator (+ - x / %) or exit: " ch

    if [ "$ch" = "exit" ]
    then
        echo "Exiting..."
        break
    fi
    
    read -p "Enter num1: " num1
    read -p "Enter num2: " num2

    # 🔹 Input validation
    if ! [[ "$num1" =~ ^[0-9]+$ && "$num2" =~ ^[0-9]+$ ]]
    then
        echo "Invalid number input"
        echo ""
        continue
    fi

    case "$ch" in
        +) result=$(add "$num1" "$num2") ;;
        -) result=$(subtract "$num1" "$num2") ;;
        x) result=$(multiply "$num1" "$num2") ;;
        /) result=$(divide "$num1" "$num2") ;;
        %) result=$(modulus "$num1" "$num2") ;;
        *) echo "Invalid operator"; continue ;;
    esac

    echo "Result: $result"
    echo ""
done
