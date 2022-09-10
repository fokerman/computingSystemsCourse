; c) Ídem al anterior pero con números de 16 bits en complemento a dos.

section .data
  arreglo: dw 52, 23, -5, 0, -65, 12, -1, 1
  longitud EQU $ - arreglo
  mensaje: DB 'El arreglo contiene 0 numeros positivos', 10
  longMje: EQU $ - mensaje

global _start
section .text

  _start:

    ; En la etiqueta arreglo se encuentran los 8 numeros.

    mov eax, 0        ; en eax guardo la cantidad de numeros mayores o iguales a 0.
    mov ebx, longitud 
    sar ebx, 1        ; en ebx guardo la longitud del arreglo: longitud / 2 (ya que cada elemento ocupa 2 bytes),
                      ; que es equivalente a hacer un shift a derecha de 1 posiciones.
    mov ecx, 0        ; ecx lo uso para el indice del arreglo.

  loop:
    cmp ecx, ebx
    jz modifcarTexto
    mov dx, [arreglo + ecx*2] ; en edx guardo el valor de la i-esima posicion del arreglo
    inc ecx
    cmp dx, 0                 ; si el valor de la i-esima posicion es mayor igual a cero incremento eax y ciclo. Si no, solo ciclo.
    jl loop
    inc eax
    jmp loop
    
  modifcarTexto:
    cmp eax, 0
    jz imprimir
    inc byte [mensaje+longMje-20] ; modifico el '0' del mensaje.
    dec eax
    jmp modifcarTexto

  imprimir:
    mov rax, 4        ; funcion 4: write
    mov rbx, 1        ; stdout
    mov rcx, mensaje  ; mensaje
    mov rdx, longMje  ; longitud
    int 0x80

    ; Exit
    mov rax, 1     ; funcion 1
    mov rbx, 0     ; codigo
    int 0x80
