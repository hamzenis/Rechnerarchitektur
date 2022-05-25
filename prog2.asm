    .text
        ori   $8,$0,0xffff
        addi  $9,$0,-16384
    loop:
        add   $8,$8,$9
        j loop