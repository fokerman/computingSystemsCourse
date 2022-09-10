section .data                  
  msg1: DB 'James P. Sullivan', 10  
  largo1 EQU $ - msg1
  msg2: DB 'Mike Wazowski', 10  
  largo2 EQU $ - msg2
                               
  global _start                
section .text                  
  _start:
    mov rax, largo1  ; 
    push rax         ; push largo1
    mov rax, msg1    ; 
    push rax         ; push msg1
    push largo2      ; push largo2
    push msg2        ; push msg2

    mov rax, 4     ; funcion 4 
    mov rbx, 1     ; stdout    
    pop rcx        ; pop msg2
    pop rdx        ; pop largo2
    int 0x80

    mov rax, 4     ; funcion 4 
    mov rbx, 1     ; stdout    
    pop rcx        ; pop msg1  
    pop rdx        ; pop largo1
    int 0x80

    mov rax, 1     ; funcion 1 
    mov rbx, 0     ; codigo    
    int 0x80                   
