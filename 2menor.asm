.data
developer:  .asciiz "Desarrollado por: Philip Lewis - Unir Colombia - 2023\n"
prompt:     .asciiz "Ingrese un número, despues presione Enter: "
result:     .asciiz "El número menor de los ingresados es: "

.text
.globl main

main:
  # mostramos el mensaje del nombre
    la $a0, developer
    li $v0, 4
    syscall
    
    # Inicialización de registros
    li $t0, 4            # Inicializamos el contador en 4 (para 4 números)
    li $t1, 0x7FFFFFFF   
    
input_loop:
    # Mostrar el prompt y leer un número entero
    li $v0, 4
    la $a0, prompt
    syscall
    
    li $v0, 5
    syscall
    
    # Comparar el número leído con el mínimo actual
    bge $v0, $t1, not_less   # Saltar si $v0 >= $t1
    
    # Si llegamos aquí, $v0 es menor que $t1
    move $t1, $v0        # Actualizar el mínimo
    
not_less:
    # Decrementar el contador y verificar si hemos leído 4 números
    subi $t0, $t0, 1
    bnez $t0, input_loop
    
    # Mostrar el resultado
    li $v0, 4
    la $a0, result
    syscall
    
    # Mostrar el mínimo
    li $v0, 1
    move $a0, $t1
    syscall
    
    # Salir del programa
    li $v0, 10
    syscall


