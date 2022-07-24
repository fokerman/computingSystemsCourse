; d) Ídem al (a) pero imprimir el texto "El arreglo contiene X numeros positivos" si la cantidad números positivos es mayor o igual a la de negativos. En caso contrario, imprimir el texto "El arreglo contiene X numeros negativos".

section .data
  arreglo: dd 52, 23, -5, 0, -65, 12, -1, 1
  longitud EQU $ - arreglo
  mensajePos: DB 'El arreglo contiene 0 numeros positivos', 10
  longMjePos: EQU $ - mensajePos
  mensajeNeg: DB 'El arreglo contiene 0 numeros negativos', 10
  longMjeNeg: EQU $ - mensajeNeg

global _start
section .text

  _start:

    ; En la etiqueta arreglo se encuentran los 8 numeros. imprimir el texto "El arreglo contiene X numeros positivos"

    mov eax, 0        ; en eax guardo la cantidad de numeros mayores o iguales a 0.
    mov ebx, longitud
    sar ebx, 2        ; en ebx guardo la longitud del arreglo: longitud / 4 (ya que cada elemento ocupa 4 bytes),
                      ; que es equivalente a hacer un shift a derecha de 2 posiciones.
    mov ecx, 0        ; ecx lo uso para el indice del arreglo.

  loop:
    cmp ecx, ebx
    jz determinarTexto
    mov edx, [arreglo + ecx*4] ; en edx guardo el valor de la i-esima posicion del arreglo.
    inc ecx
    cmp edx, 0                 ; si el valor de la i-esima posicion es mayor igual a cero incremento eax y ciclo. Si no, solo ciclo.
    jl loop
    inc eax
    jmp loop
  
  determinarTexto:
    sub ebx, eax              ; en ebx guardo cuantos numeros negativos hay en el arreglo.
    cmp ebx, eax              ; si hay mas negativos que positivos, salto a modificarTextoNeg. Si no, salto a modificarTextoPos.
    jg modificarTextoNeg
    jmp modificarTextoPos
  
  modificarTextoNeg:
    cmp ebx, 0
    jz imprimirTextoNeg
    inc byte [mensajeNeg+longMjeNeg-20]
    dec ebx
    jmp modificarTextoNeg

  modificarTextoPos:
    cmp eax, 0
    jz imprimirTextoPos
    inc byte [mensajePos+longMjePos-20]
    dec eax
    jmp modificarTextoPos

  imprimirTextoNeg:
    mov rax, 4           ; funcion 4: write
    mov rbx, 1           ; stdout
    mov rcx, mensajeNeg  ; mensaje
    mov rdx, longMjeNeg  ; longitud
    int 0x80
    jmp exit
  
  imprimirTextoPos:
    mov rax, 4           ; funcion 4: write
    mov rbx, 1           ; stdout
    mov rcx, mensajePos  ; mensaje
    mov rdx, longMjePos  ; longitud
    int 0x80

  exit:
    ; Exit
    mov rax, 1     ; funcion 1
    mov rbx, 0     ; codigo
    int 0x80
