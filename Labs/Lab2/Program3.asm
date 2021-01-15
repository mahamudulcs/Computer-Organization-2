.begin
.org 2048
main: ld [x], %r2      !11 00010 000000 00000 1 0101110111000 load x into %r2
top: subcc %r1, 4, %r0 !10 00000 010100 00001 1 0000000000100 subtract %r1 and 4 then store into %r0
be done                !00 0 0001 010 0000000000000000000100 branch if zero into done
srl %r2, 1, %r2        !10 00010 100 1100001010000000000001 shift right by 1 digit from %r2 and store into %r2 
addcc %r1, 1, %r1      !10 00001 010000 00001 1 0000000000001 add %r1 and 1 then store into %r1
ba top                 !00 0 1000 010 1111111111111111111100 branch always to the memory location top
done: st %r3, [y]      !11 00011 000100 00000 1 0101110111100 store %r3 into y
jmpl %r15+4, %r0       !10 0 0000 111 0000111110000000000100 return to calling function
.org 3000
x: 800
y: 0
.end                   !the content of %r1 is 100
