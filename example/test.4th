[text-section] init

[code]
 org $2000
[end-code]

[text-section] text

[include] "lib/core.4th"
[include] "lib/addons.4th"

: main
  i-dont-exist
  dos
;

[code]
 run boot
[end-code]

