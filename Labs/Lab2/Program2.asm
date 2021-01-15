! Program 2
.begin
.org 2048
m_start: ld [x], %r1      !11 00001 000000 00000 1 0100000100100   load x into %r1
ld [y], %r2               !11 00010 000000 00000 1 0100000101000   load y into %r2
subcc %r1, %r2, %r0       !10 00000 010100 00001 0 00000000 00010  subtract %r1 and %r2 then store into %r0
bne else                  !00 0 1111 010 0000000000000000000011 branch if not equal to zero into memory location else
andcc %r1, %r2, %r3       !10 00011 010001 00001 0 00000000 00010 bitwise logical and to %r3
ba done                   !00 0 1000 010 0000000000000000000010 branch always into done
else: orcc %r1, %r2, %r3  !10000110100100000100000000000010 bitwise logical or to %r3
done: st %r3, [a]         !11 00011 000100 00000 1 01000001 01100 store %r3 into a
jmpl %r15+4, %r0          !10 0 0000 111 0000111110000000000100 Return to calling function
x: 30
y: 48
a: 0
.end                      ! the content of %r3 is 111110
