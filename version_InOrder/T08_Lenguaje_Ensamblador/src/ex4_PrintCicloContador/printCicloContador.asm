section .data                  
  msg: DB 'Hola Mundo 0', 10     
  largo EQU $ - msg            
                               
  global _start                
section .text

  printHolaMundo:
    push rbx
    mov rax, 4     ; funcion 4 
    mov rbx, 1     ; stdout    
    mov rcx, rdi   ; mensaje   
    mov rdx, rsi   ; longitud  
    int 0x80
    pop rbx
    ret

  _start:                
    mov rbx, 10
    ciclo:
      mov rdi, msg
      mov rsi, largo
      call printHolaMundo
      inc byte [msg+largo-2]
      sub rbx, 1
      cmp rbx, 0
      jnz ciclo
      
    mov rax, 1     ; funcion 1 
    mov rbx, 0     ; codigo    
    int 0x80                   




