.data
    prompt: .asciiz "Ingrese un n�mero: "
    resultMsg: .asciiz "\nEl n�mero menor es: "
    numbers: .space 12 # espacio para 3 n�meros (4 bytes cada uno)

.text
.globl main

main:
    # Solicitar el primer n�mero
    li $v0, 4
    la $a0, prompt
    syscall

    # Leer el primer n�mero
    li $v0, 5
    syscall
    move $t0, $v0 # almacenar el primer n�mero en $t0

    # Solicitar el segundo n�mero
    li $v0, 4
    la $a0, prompt
    syscall

    # Leer el segundo n�mero
    li $v0, 5
    syscall
    move $t1, $v0 # almacenar el segundo n�mero en $t1

    # Solicitar el tercer n�mero
    li $v0, 4
    la $a0, prompt
    syscall

    # Leer el tercer n�mero
    li $v0, 5
    syscall
    move $t2, $v0 # almacenar el tercer n�mero en $t2

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
