section .data
    prompt1 db "Ingrese el primer numero: ", 0
    prompt2 db "Ingrese el segundo numero: ", 0
    resultMsg db "La suma de los numeros es: ", 0
    newline db 10

section .bss
    num1 resb 1
    num2 resb 1
    sum resb 1

section .text
    global _start

_start:
    ; Imprimir mensaje para el primer número
    mov rax, 1          ; syscall: sys_write
    mov rdi, 1          ; file descriptor: stdout
    mov rsi, prompt1    ; dirección del mensaje
    mov rdx, 25         ; longitud del mensaje
    syscall

    ; Leer el primer número
    mov rax, 0          ; syscall: sys_read
    mov rdi, 0          ; file descriptor: stdin
    mov rsi, num1       ; buffer para almacenar el input
    mov rdx, 1          ; número de bytes a leer
    syscall
    sub byte [num1], 48 ; convertir ASCII a entero

    ; Imprimir mensaje para el segundo número
    mov rax, 1
    mov rdi, 1
    mov rsi, prompt2
    mov rdx, 26
    syscall

    ; Leer el segundo número
    mov rax, 0
    mov rdi, 0
    mov rsi, num2
    mov rdx, 1
    syscall
    sub byte [num2], 48 ; convertir ASCII a entero

    ; Realizar la suma
    mov al, [num1]
    add al, [num2]
    mov [sum], al

    ; Imprimir el mensaje de resultado
    mov rax, 1
    mov rdi, 1
    mov rsi, resultMsg
    mov rdx, 30
    syscall

    ; Imprimir el resultado
    mov al, [sum]
    add al, 48          ; convertir entero a ASCII
    mov rdi, 1
    mov rsi, sum
    mov rdx, 1
    mov rax, 1
    mov rdi, 1
    mov rsi, sum
    mov rdx, 1
    syscall

    ; Imprimir nueva línea
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall

    ; Salir del programa
    mov rax, 60         ; syscall: exit
    xor rdi, rdi        ; código de salida 0
    syscall
