org 0x7C00              ; Set the origin (starting address) to 0x7C00, which is the standard location for bootloaders in memory.
bits 16                 ; Set the mode to 16-bit, as the x86 architecture begins in real mode.

%define ENDL 0x0D, 0x0A


start:
    jmp main

;
; Prints a string to the screen.
; Params:
;   - ds:si points to string
;

puts:
    ; save registers we will modify
    push si
    push ax

.loop:
    lodsb               ; loads next character in al
    or al, al           ; verify if next character is null?
    jz .done 

    mov ah, 0x0e        ; call bios interrupt
    int 0x10

    jmp .loop

.done:
    pop ax
    pop si
    ret 

main:                   ; Define the main entry point label for the program.

    ; setup data segments
    mov ax, 0               ; can't write to ds/es directly
    mov ds, ax
    mov es, ax

    ; setup stack
    mov ss, ax
    mov sp, 0x7C00          ; stack grows downwards from where we are loaded in memory

    ; print message
    mov si, msg_hello
    call puts


    hlt                 ; Halt the CPU, stopping execution temporarily (until a reset or interrupt occurs).

.halt:                  ; Define a label named ".halt" as an infinite loop to prevent further execution.
    jmp .halt           ; Jump to ".halt" label, creating an infinite loop to keep the CPU halted.

msg_hello: db 'Hello World! le User', ENDL, 0

times 510-($-$$) db 0   ; Pad the rest of the file with zeros until we reach 510 bytes (bootloader must be exactly 512 bytes).
dw 0AA55h               ; Write the boot signature (0xAA55) as the final two bytes, required for the BIOS to recognize it as a valid bootable sector.
