( Forth Words from the CORE word set                   )
( see http://www.forth200x.org/documents/forth16-1.pdf )

\ 6.1.1320 EMIT 
\ print TOS as character on screen
: emit ( n -- )
    [code]
    lda pstack,x  ; load char from stack
    inx           ; adjust stack pointer
    inx           ;
    stx tmp       ; save stack pointer
    jsr do_ec     ; jump to OS print char function
    ldx tmp       ; restore stack pointer
    jmp next      ; naechstes Forth-Wort

do_ec             ; indirect jump to Atari OS
    tax           ; function to print char
    lda $E407     ; on screen
    pha        
    lda $E406  
    pha
    txa
    rts
[end-code] ;

\ 6.1.1750 KEY
\ read one character from keyboard
\ word waits for keypress
: key ( -- n )
[code]
    lda #0
    dex           ; create space on stack
    sta pstack,x  ; clear high-byte 
    stx w         ; save stack pointer
    jsr do_gc     ; jump to OS routine to read key
    ldx w         ; restore stack pointer
    dex           ; create space for low byte
    sta pstack,x  ; store key value in low byte
    jmp next      ; next Forth word

do_gc             ; indirect jump to Atari OS 
    lda $E425     ; Routine to read char from
    pha           : keyboard
    lda $E424
    pha
    rts
[end-code] ;

\ 6.1.0980 COUNT
\ Return the character string specification for the
\ counted string stored at c-addr1. c-addr2 is the
\ address of the first character after c-addr1.
\ u is the contents of the character at c-addr1,
\ which is the length in characters of the string at
\ c-addr2.
: count ( c-addr1 -- c-addr2 u )
  dup c@ swap 1+ swap ;

\ 6.1.2310 TYPE
\ If u is greater than zero, display the character
\ string specified by c-addr and u.
: type ( c-addr u -- )
    0 do dup i + c@ emit loop drop ;

\ Leave program and enter DOS via DOSVEC ($0A)
: dos
    [code]
    jmp ($0A)
    [end-code] ;

