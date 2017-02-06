
[text-section] init

[code]
 org $2000
[end-code]

[text-section] text

: main
  $58 @ $190 erase
  begin again ;

[code]
 run boot
[end-code]
