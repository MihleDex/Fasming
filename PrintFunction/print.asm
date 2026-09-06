format ELF64 executable
entry main
define SYS_EXIT 60
define EXIT_OK 1
define STD_OUT 1
define SYS_WRITE 1

main:
	mov rdi, s_test
	call strsize
	mov rsi, s_test
	call print
	call exit 

exit:
        mov rax, SYS_EXIT
	mov rdi, EXIT_OK
	syscall

print: 
	mov rax, SYS_WRITE
	mov rdi, STD_OUT
	mov rdx, rcx
	syscall
	ret

	
strsize:
	mov rax, rdi
	mov rcx, 0
	

.loop:
	mov bl, [rax]
	cmp bl, 0
	je .done
	inc rax
	inc rcx
	jmp .loop

.done:
	mov rax, rcx
	ret

segment readable writable
s_test db "Test String", 10,0

