
[text-section] init

[code]
 org $0f00
[end-code]

[text-section] text

$9150 variable var3ED9
1 variable varIsGameOver

: word3ee3 var3ED9 @ ;

: >R
[code]
lda pstack+1,x
pha
lda pstack,x
pha
inx
inx
jmp next
[end-code] ;

: R>
[code]
dex
dex
pla
sta pstack,x
pla
sta pstack+1,x
jmp next
[end-code] ;

:cfa 2 - ;

0 variable var7150
1f5 constant const74e2

: word7af0
  0 var7150 !
  0x260b const74e2 - 0x76a9 !
  0 0x41 !

: select [ ] swap 2 * + @ execute ;


: main
    word7af0
    begin again ;

[code]
 run boot
[end-code]

