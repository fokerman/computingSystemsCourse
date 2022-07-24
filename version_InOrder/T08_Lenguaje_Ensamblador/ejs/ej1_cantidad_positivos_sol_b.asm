; b) Ídem al anterior pero imprimir el texto "El arreglo contiene X numeros positivos", con X el número que corresponda.

section .data
  arreglo: dd 52, 23, -5, 0, -65, 12, -1, 1
  longitud EQU $ - arreglo
  mensaje: DB 'El arreglo contiene 0 numeros positivos', 10
  longMje: EQU $ - mensaje

global _start
section .text

  _start:

    ; En la etiqueta arreglo se encuentran los 8 numeros.

    mov eax, 0        ; en eax guardo la cantidad de numeros mayores o iguales a 0.
    mov ebx, longitud 
    sar ebx, 2        ; en ebx guardo la longitud del arreglo: longitud / 4 (ya que cada elemento ocupa 4 bytes),
                      ; que es equivalente a hacer un shift a derecha de 2 posiciones.
    mov ecx, 0        ; ecx lo uso para el indice del arreglo.

  loop:
    cmp ecx, ebx
    jz modifcarTexto
    mov edx, [arreglo + ecx*4] ; en edx guardo el valor de la i-esima posicion del arreglo.
    inc ecx
    cmp edx, 0                 ; si el valor de la i-esima posicion es mayor igual a cero incremento eax y ciclo. Si no, solo ciclo.
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
