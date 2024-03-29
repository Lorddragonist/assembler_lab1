.data
prompt: .asciiz "Ingrese el numero de elementos de la serie Fibonacci: "
resultMsg: .asciiz "Serie Fibonacci: "

.text
.globl main

main:
    # Pedir al usuario el numero de elementos de la serie
    li $v0, 4
    la $a0, prompt
    syscall
    
    li $v0, 5 # Leer el numero entero
    syscall
    move $a1, $v0 # Mover el numero le�do a $a1 para guardar el total de elementos

    # Verificar si el numero es v�lido para proceder
    li $t0, 0 # Primer numero de Fibonacci
    li $t1, 1 # Segundo numero de Fibonacci
    li $t2, 0 # �ndice del bucle

    loop_cond:
        bge $t2, $a1, end_loop # Si el �ndice es mayor o igual al numero de elementos, terminar
        
        # Imprimir el numero de Fibonacci actual
        li $v0, 1
        move $a0, $t0
        syscall
        
        # Calcular el siguiente numero de Fibonacci
        add $t3, $t0, $t1
        move $t0, $t1
        move $t1, $t3
        
        addi $t2, $t2, 1 # Incrementar el �ndice
        j loop_cond # Saltar al inicio del bucle
    
    end_loop:
    # Terminar el programa
    li $v0, 10
    syscall
