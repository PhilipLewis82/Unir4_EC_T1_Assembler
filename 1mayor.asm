.data
developer:   .asciiz "Desarrollado por: Philip Lewis - Unir Colombia - 2023\n"
prompt:      .asciiz "Por Favor ingresa un número, despues presiona Enter "
result:      .asciiz "El mayor de los numeros ingresados es: "
gracias:     .asciiz "  Gracias!!!!: "
.text
.globl main
main:
    # mostramos el mensaje del nombre
    la $a0, developer
    li $v0, 4
    syscall
    # Inicializamos las variables
    li $t0, 0         # $t0 se usará para contar
    li $t1, 0         # $t1 se usará para almacenar el número mayor
input_loop:
    # mostramos el mensaje de solicitud de los numeros
    la $a0, prompt
    li $v0, 4
    syscall
    # se lee  un número
    li $v0, 5
    syscall
    # guardamos el número ingresado en $t2
    move $t2, $v0
    # compara con el número mayor actual
    bge $t2, $t1, update_max
    # contador +1  
    addi $t0, $t0, 1
    # Funciona mientras ingresamos 4 numeros
    bne $t0, 4, input_loop
    # Mostramos en pantalla el número mayor
    la $a0, result
    li $v0, 4
    syscall
    move $a0, $t1
    li $v0, 1
    syscall
    # Salir
    li $v0, 10
    syscall
update_max:
    # Actualizamos el número mayor
    move $t1, $t2
    # Incrementamos el contador
    addi $t0, $t0, 1
    # Si todavía no hemos ingresado 4 números, repetimos el ciclo
    bne $t0, 4, input_loop
    # Mostramos en pantallael número mayor
    la $a0, result
    li $v0, 4
    syscall
    move $a0, $t1
    li $v0, 1
    syscall
    # Mostrar mensaje de gracias
    la $a0, gracias
    li $v0, 4
    syscall
    # Salimos del programa
    li $v0, 10
    syscall
