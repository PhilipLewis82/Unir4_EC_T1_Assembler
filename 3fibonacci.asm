.data
developer:   .asciiz "Desarrollado por: Philip Lewis - Unir Colombia - 2023\n"
prompt:      .asciiz "Mostraremos verticalmente los primeros 20 numeros de la serie Fibonacci "
fib_numbers: .space 80     # Espacio para almacenar los números de Fibonacci (20 números * 4 bytes cada uno)
newline:     .asciiz "\n" # Carácter de nueva línea para imprimir

.text
.globl main

main:
# mostramos el mensaje del nombre
    la $a0, developer
    li $v0, 4
    syscall
    la	$a0, prompt
    li	$v0, 4
    syscall 
        
    # Inicializar los dos primeros números de Fibonacci
    li $t0, 0   # Primer número: Fib(0)
    li $t1, 1   # Segundo número: Fib(1)
    li $t2, 20  # Contador para 20 números

loop:
    # Imprimir el número actual de Fibonacci
    move $a0, $t0    # Cargar el número en $a0 para imprimirlo
    li $v0, 1         # Código de la llamada al sistema para imprimir un entero
    syscall

    # Imprimir un espacio en blanco
    li $v0, 4         # Código de la llamada al sistema para imprimir una cadena
    la $a0, newline   # Cargar la dirección de la cadena newline en $a0
    syscall

    # Calcular el siguiente número de Fibonacci
    add $t3, $t0, $t1  # $t3 = $t0 + $t1 (Fibonacci siguiente)
    move $t0, $t1      # Mover $t1 a $t0 para la siguiente iteración
    move $t1, $t3      # Mover $t3 (nuevo Fibonacci) a $t1

    # Decrementar el contador
    subi $t2, $t2, 1

    # Verificar si hemos mostrado los 20 números
    bnez $t2, loop

    # Terminar el programa
    li $v0, 10        # Código de la llamada al sistema para salir
    syscall
