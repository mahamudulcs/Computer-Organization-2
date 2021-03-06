.begin
.org 2048
main: ld [a], %r1          !11 00001 000000 00000 1 0101110111000   load a into %r1
ld [b], %r2                !11 00010 000000 00000 1 0101110111100   load b into %r2
ld [c], %r3                !11 00011 000000 00000 1 0101111000000   load c into %r3
top: subcc %r4, 3, %r0     !10 00000 010100 00100 1 0000000000011   subtract %r4 and 3 then store into %r0
be done                    !00 0 0001 010 0000000000000000001010    branch if equal to zero into done
subcc %r5, %r6, %r0        !10 00000 010100 00101 0 00000000 00110  subtract %r5 and %r6 then store into %r0
bneg else                  !00 0 0101 010 0000000000000000000100    branch if negative to else
orcc %r1, %r2, %r1         !10 00001 010010 00001 0 00000000 00010  bitwise logical or into %r1
addcc %r6, 1, %r6          !10 00110 010000 00110 1 0000000000001 add %r6 and 1 then store into %r6
ba bottom                  !00 0 1000 010 0000000000000000000011 branch always to bottom
else: andcc %r1, %r3, %r1  !10 00001 010001 00001 0 00000000 00011 bitwise logical and into %r1
addcc %r5, 1, %r5          !10001010100000010110000000000001 add %r5 and 1 then store into %r5
bottom: addcc %r4, 1, %r4  !10 00100 010000 00100 1 0000000000001 add %r4 and 1 then store into %r4
ba top                     !00 0 1000 010 1111111111111111110110 branch always to top
done: st %r3, [y]          !11 00011 000100 00000 1 0101111000100 store %r3 into y
jmpl %r15+4, %r0           !10 0 0000 111 0000111110000000000100 return to calling function
.org 3000
a: 0xa0
b: 0x33
c: 0x52
y: 2
.end                       !the content of %r4 is 11
