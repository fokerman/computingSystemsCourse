; a) Dado un arreglo de 8 números de 32 bits en complemento a dos,
; imprimir por pantalla en hexadecimal la cantidad de números mayores o iguales a cero contenidos en el arreglo.

section .data
  arreglo: dd 52, 23, -5, 0, -65, 12, -1, 1
  longitud EQU $ - arreglo

global _start
section .text

  _start:

    ; En la etiqueta arreglo se encuentran los 8 numeros.

    mov rax, 0        ; en rax guardo la cantidad de numeros mayores o iguales a 0.
    mov ebx, longitud 
    sar ebx, 2        ; en ebx guardo la longitud del arreglo: longitud / 4 (ya que cada elemento ocupa 4 bytes),
                      ; que es equivalente a hacer un shift a derecha de 2 posiciones.
    mov ecx, 0        ; ecx lo uso para el indice del arreglo.

  loop:
    cmp ecx, ebx
    jz fin
    mov edx, [arreglo + ecx*4] ; en edx guardo el valor de la i-esima posicion del arreglo.
    inc ecx
    cmp edx, 0                 ; si el valor de la i-esima posicion es mayor igual a cero incremento eax y ciclo. Si no, solo ciclo.
    jl loop
    inc rax
    jmp loop
    
  fin:
    ;push rax ; en este caso no es necesario salvar rax porque no lo vamos a usar más.
    mov rdi, rax
    call printHex
    ;pop rax

    ; Exit
    mov rax, 1     ; funcion 1
    mov rbx, 0     ; codigo
    int 0x80

printHex:
  push rbx
  push r12
  push r13
  push r14
  push r15
  push rbp
  mov rcx, 15
  mov rbx, hexachars
  .ciclo:
    mov rax, rdi
    and rax, 0xF
    mov dl, [rbx+rax]
    mov [number+rcx], dl
    dec rcx
    shr rdi, 4
    cmp rcx, -1
    jnz .ciclo
  mov rax, 4      ; funcion 4
  mov rbx, 1      ; stdout
  mov rcx, number ; mensaje
  mov rdx, 17     ; longitud	
  int 0x80
  pop rbp
  pop r15
  pop r14
  pop r13
  pop r12
  pop rbx
ret

section .rodata
  hexachars: db "0123456789ABCDEF"

section .data
  number:    db "0000000000000000",10
