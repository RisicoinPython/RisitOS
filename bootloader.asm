; RisitOS Bootloader / provided under MIT Licence 


BITS 16

start:
	mov ax, 07C0h		
	add ax, 288		
	mov ss, ax
	mov sp, 4096

	mov ax, 07C0h		
	mov ds, ax


	mov si, message_bienvenue
	call print_mb	

	jmp $			


	message_bienvenue db 'RisitOS, Bienvenue !', 0
	
print_mb:			
	mov ah, 0Eh		
.repeat:
	lodsb			
	cmp al, 0
	je .done		
	int 10h			; bios int for char printing
	jmp .repeat

.done:
	ret

	times 510-($-$$) db 0	
	dw 0xAA55		; bios signature 