.begin
.org 2048
dstart .equ 4000
ld [a], %r1         !11 00001 000000 00000 1 0111110100000 load a into %r1
ld [b], %r2         !11 00010 000000 00000 1 0111110100100 load b into %r2
ld [c], %r3         !11 00011 000000 00000 1 0111110101000 load c into %r3
addcc %r2, %r3, %r0 !10 00000 010000 00010 0 0000000000011 add %r2 and %r3 and store it into %r0
addcc %r1, %r0, %r4 !10 00100 010000 00001 0 0000000000000 add %r2 and %r3 and store it into %r0
subcc %r2, %r4, %r2 !10 00010 010100 00010 0 0000000000100 subtract %r2 and %r3 then store it into %r0
st %r0, [a]         !11 00000 000100 00000 1 0111110100000 store %r0 into a
st %r2, [y]         !11 00010 000100 00000 1 0111110101100 store %r2 into y
jmpl %r15 + 4, %r0  !10 00000 111000 01111 1 0000000000100 return to calling function
.org dstart
a: 15
b: 54               !the content of r4 is 1111
c: -29
y: 0
.end

