; RisitOS Bootloader  / provided under MIT Licence 

; Based on a free boot loader by E Dehling. Boot then scan FAT12 floppy for KHEYRNEL.BIN, then loads it and executes it


;__________________________________________________
;________________░▓█▓█▓▓▓▓█▓▓▒░____________________
;_______________▒█▓▓▓█████████▓▓▓▒_________________
;______________▓██▓██████▓▓▓▓▓▓▓▓▓▓░_______________
;_____________▒▓██████▓▓▓▓▓▒▒░░░░░▒▓▓______________
;_____________▓▓▓▓▓▓▓▓▒▒▒▒▒░__░░░▒▒▓█▓░____________
;____________░▓▒▒▒▒▒▒▒▒▒▒░░░░░░░░░▒▓███░___________
;____________▒▓▒▒▒▒▒▒▒▒░░░░░░░░░▒▒▒▒▓██▒___________
;____________▒▒▒▒▒▒▒▒▒▒░░░░░░▒▒▒▒▒▒▓▓███___________
;___________░▒▒▒▒▒▒▒▒▒░░░░░░▒▒▒▒▒▒▓▓▓███░__________
;___________░▒▒▒▒▒▒▒▒▒░░░░░░▒▒▒▒▒▒▓▓▓███▒__________
;___________░▒▒▒░▒▒▒▒░░░░░░▒▒▒▒▒▒▓▓▓████▒__________
;___________▒▒▒▒░░░░░░░░░░░▒▒▒▒▒▒▓▓▓████▒__________
;___________▒▒▒▒░░░░░░░░░░░▒▒▒▒▒▒▒▓▓███▓▒__________
;___________▓▓▓▓▒▒░░░▒▒▓▓▓█▓▓▒▒▒▒▒▓▓█▓▓█▓__________
;___________▓████▓▒░░▒▓▓▓▒▒▒▒▒▒▒▒▒▓▓████▒__________
;___________▓▓▒▒▒▓▓▒░░▒▒▓▓▓▒▒▓▓▒▒▒▓▓███▓▓░_________
;___________▓██▓▒▓▓▒░░▒▒▓▓█▓▓▓▒▒▒▒▒▓▓█▓▓▓▒_________
;___________▒▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓██▓▓▓▒_________
;___________▒▓▓▒▒▒▒▒▒▒▒▒▒▒░░░▒░▒▒▒▒▓███▓▓▒_________
;___________▒▒▒▒▒▒▒░░▒▒▒░░░░░░░▒▒▒▒▓███▓▓░_________
;___________▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░▒▒▒▒▓▓██▓▒▒__________
;___________▒▒▒▒▒▓█▓▓▓▓▓▒░░░░▒▒▒▒▒▓▓▓█▓▒░__________
;___________▒▒▒▒▒███████▓▓▒░░▒▒▒▒▓▓▓▓▓▒▒___________
;___________░▒▒▒██████████▓▒▒▒▒▒▒▓▓▓▓▓▓░___________
;____________▒▒████▓▒▓▓▓▓██▓▒▒▒▒▒▓▓▓▓▓_____________
;___________▒▒██████████▓▓▓▒▒▒▒▓▓▓▓▓█▓▒___________
;___________░▒▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓████▒░________
;____________░▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓█▓▓▓▓▓▒░_______
;__________░▒▒▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓█▓▓▓▓▓▓▒░░______
;░_░░░░_░░░░▒▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓█▓▓▓▓█▓▓░▒░______
;__░░░░░░░░▒▒▓█▓▓▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓█▓▓▓▓▓▓▓░▒▒░_░░___
;░░░░░░░░░▒▒▓█▒█▓▓▒▒▒▒▒▒▓▓▓▓▓▓▓██▓▓▓▓▓▓▓▒▒▒░░▒▒____
;░░░░░▒▒▒▒▒▒▓▓▓███▓▓▓▓▓▓▓▓▓▓▓▓█▓▓▓▓▓▓▓▓▒▒▒▒░▒▒░░░__
;░░▒▒▒▒▒▒▒▒▓▓▓▓▓██▓▓▓▓▓▓▓▓▓▓██▓▓▓▓▓▓▓▓▒▓▒▒▒▒▒▒░░░░░
;▒░▒▒▒▒▒▒▒▒▒▓▓▓▓▓███▓▓▓▓▓███▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒░░░░░░
;▒▒▒▒▒▒▒▒▒▒▒▓▓▓▒▓▓███▓████▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▓▒▒░░░░░░


	BITS 16

	jmp short boot_initialize	
	nop				


OEMLabel		db "RISIBOOT"	
BytesPerSector		dw 512		
SectorsPerCluster	db 1		
ReservedForBoot		dw 1		
NumberOfFats		db 2		
RootDirEntries		dw 224		
					; (224 * 32 = 7168 = 14 sectors to read)
LogicalSectors		dw 2880		
MediumByte		db 0F0h		
SectorsPerFat		dw 9		
SectorsPerTrack		dw 18		
Sides			dw 2		
HiddenSectors		dd 0		
LargeSectors		dd 0		
DriveNo			dw 0		
Signature		db 41		
VolumeID		dd 00000000h	
VolumeLabel		db "RISITOS     "
FileSystem		db "FAT12   "	




boot_initialize:
	mov ax, 07C0h			
	add ax, 544			
	cli				
	mov ss, ax
	mov sp, 4096
	sti				

	mov ax, 07C0h			
	mov ds, ax

	

	cmp dl, 0
	je no_change
	mov [bootdev], dl		
	mov ah, 8			
	int 13h
	jc fatal_disk_error
	and cx, 3Fh			
	mov [SectorsPerTrack], cx	
	movzx dx, dh			
	add dx, 1			
	mov [Sides], dx

no_change:
	mov eax, 0			




floppy_ok:				
	mov ax, 19			
	call l2hts

	mov si, buffer			
	mov bx, ds
	mov es, bx
	mov bx, si

	mov ah, 2			
	mov al, 14			

	pusha				


read_root_dir:
	popa				
	pusha

	stc				
	int 13h				

	jnc search_dir			
	call reset_floppy		
	jnc read_root_dir		

	jmp reboot			


search_dir:
	popa

	mov ax, ds			
	mov es, ax			
	mov di, buffer

	mov cx, word [RootDirEntries]	
	mov ax, 0			


next_root_entry:
	xchg cx, dx			

	mov si, kern_filename		
	mov cx, 11
	rep cmpsb
	je found_file_to_load		

	add ax, 32			

	mov di, buffer			
	add di, ax

	xchg dx, cx			
	loop next_root_entry

	mov si, file_not_found		
	call print_string
	jmp reboot


found_file_to_load:			
	mov ax, word [es:di+0Fh]	
	mov word [cluster], ax

	mov ax, 1			
	call l2hts

	mov di, buffer			
	mov bx, di

	mov ah, 2			
	mov al, 9			

	pusha				


read_fat:
	popa				
	pusha

	stc
	int 13h				

	jnc read_fat_ok			
	call reset_floppy		
	jnc read_fat			


fatal_disk_error:

	mov si, disk_error		
	call print_string
	jmp reboot			


read_fat_ok:
	popa

	mov ax, 2000h			
	mov es, ax
	mov bx, 0

	mov ah, 2			
	mov al, 1

	push ax				




load_file_sector:
	mov ax, word [cluster]		
	add ax, 31

	call l2hts			

	mov ax, 2000h			
	mov es, ax
	mov bx, word [pointer]

	pop ax			
	push ax

	stc
	int 13h

	jnc calculate_next_cluster	

	call reset_floppy		
	jmp load_file_sector


	

calculate_next_cluster:
	mov ax, [cluster]
	mov dx, 0
	mov bx, 3
	mul bx
	mov bx, 2
	div bx				
	mov si, buffer
	add si, ax			
	mov ax, word [ds:si]

	or dx, dx			

	jz even				
					

odd:
	shr ax, 4			
	jmp short next_cluster_cont


even:
	and ax, 0FFFh			


next_cluster_cont:
	mov word [cluster], ax		

	cmp ax, 0FF8h			
	jae end

	add word [pointer], 512		
	jmp load_file_sector


end:					
	pop ax				
	mov dl, byte [bootdev]		

	jmp 2000h:0000h			



; bootloader functions

reboot:
	mov ax, 0
	int 16h				
	mov ax, 0
	int 19h				


print_string:				
	pusha

	mov ah, 0Eh			

.repeat:
	lodsb				
	cmp al, 0
	je .done			
	int 10h				
	jmp short .repeat

.done:
	popa
	ret


reset_floppy:		
	push ax
	push dx
	mov ax, 0
	mov dl, byte [bootdev]
	stc
	int 13h
	pop dx
	pop ax
	ret


l2hts:			
			
	push bx
	push ax

	mov bx, ax			

	mov dx, 0			
	div word [SectorsPerTrack]
	add dl, 01h			
	mov cl, dl			
	mov ax, bx

	mov dx, 0			
	div word [SectorsPerTrack]
	mov dx, 0
	div word [Sides]
	mov dh, dl			
	mov ch, al			

	pop ax
	pop bx

	mov dl, byte [bootdev]	

	ret

;db

	kern_filename	db "KHEYRNEL  BIN"	; 

	disk_error	db "PAS DE CHANCE, erreur de disque !", 0
	file_not_found	db "KHEYRNEYL a disparus !", 0

	bootdev		db 0 	
	cluster		dw 0 	
	pointer		dw 0 	




	times 510-($-$$) db 0	
	dw 0AA55h		; Bios Boot Signature


buffer:				




