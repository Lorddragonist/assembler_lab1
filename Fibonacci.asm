.data
prompt: .asciiz "Ingrese el número de elementos de la serie Fibonacci: "
resultMsg: .asciiz "Serie Fibonacci: "

.text
.globl main

main:
    # Pedir al usuario el número de elementos de la serie
    li $v0, 4
    la $a0, prompt
    syscall
    
    li $v0, 5 # Leer el número entero
    syscall
    move $a1, $v0 # Mover el número leído a $a1 para guardar el total de elementos

    # Verificar si el número es válido para proceder
    li $t0, 0 # Primer número de Fibonacci
    li $t1, 1 # Segundo número de Fibonacci
    li $t2, 0 # Índice del bucle

    loop_cond:
        bge $t2, $a1, end_loop # Si el índice es mayor o igual al número de elementos, terminar
        
        # Imprimir el número de Fibonacci actual
        li $v0, 1
        move $a0, $t0
        syscall
        
        # Calcular el siguiente número de Fibonacci
        add $t3, $t0, $t1
        move $t0, $t1
        move $t1, $t3
        
        addi $t2, $t2, 1 # Incrementar el índice
        j loop_cond # Saltar al inicio del bucle
    
    end_loop:
    # Terminar el programa
    li $v0, 10
    syscall
