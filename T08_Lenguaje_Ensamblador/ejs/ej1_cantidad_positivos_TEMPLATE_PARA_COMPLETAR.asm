section .data
  arreglo: dd 52, 23, -5, 0, -65, 12, -1, 1

global _start
section .text

  _start:

    ; En la etiqueta arreglo se encuentran los 8 numeros.

    ; COMPLETAR

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
