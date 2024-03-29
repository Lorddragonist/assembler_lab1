.data
    prompt: .asciiz "Ingrese un numero: "
    resultMsg: .asciiz "\nEl numero menor es: "
    numbers: .space 12 # espacio para 3 numeros (4 bytes cada uno)

.text
.globl main

main:
    # Solicitar el primer numero
    li $v0, 4
    la $a0, prompt
    syscall

    # Leer el primer numero
    li $v0, 5
    syscall
    move $t0, $v0 # almacenar el primer numero en $t0

    # Solicitar el segundo numero
    li $v0, 4
    la $a0, prompt
    syscall

    # Leer el segundo numero
    li $v0, 5
    syscall
    move $t1, $v0 # almacenar el segundo numero en $t1

    # Solicitar el tercer numero
    li $v0, 4
    la $a0, prompt
    syscall

    # Leer el tercer numero
    li $v0, 5
    syscall
    move $t2, $v0 # almacenar el tercer numero en $t2

    # Comparar $t0 y $t1, y almacenar el mayor en $t3
    blt $t0, $t1, compareThird
    move $t3, $t1
    j continueComparison

compareThird:
    move $t3, $t0

continueComparison:
    # Comparar el mayor de $t0 y $t1 con $t2
    blt $t3, $t2, printResult
    move $t3, $t2

printResult:
    # Imprimir el resultado
    li $v0, 4
    la $a0, resultMsg
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    # Salir
    li $v0, 10
    syscall
