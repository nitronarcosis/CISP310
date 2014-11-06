.data
# uint32 result;
result: .fill 4
# uint8 ch;
ch: .fill 1
# uint32 num;
num: .fill 4
#
.text
.global _start
_start:

loopStart:
# do
# {
#   result = read(0, &ch, 1);
movl $3, %eax
movl $0, %ebx
movl $ch, %ecx
movl $4, %edx
movl %eax, result
int $0x80
#   if (result)
cmpl $0, %eax
jz endOuterIf
#   {
#     if ((ch <= '9') && (ch >= '0'))
cmpb $'0', ch
jb elseIf
cmpb $'9', ch
jnb elseIf
#     {
#       write(1, &ch, 1);
movl $4, %eax
movl $1, %ebx
movl $ch, %ecx
movl $4, %edx
int $0x80
#       num = num + num;
movl num, %eax
addl %eax, num
#       num = num + num;
movl num, %eax
addl %eax, num
#       num = num + num;
movl num, %eax
addl %eax, num
#       num = num + num;
movl num, %eax
addl %eax, num
#       num = num + ch - '0';
movl num, %eax
# addl ch, %eax
movl $0, %ebx
addb ch, %bl
addl %ebx, %eax
subl $'0', %eax
movl %eax, num
jmp endOuterIf
#     }
elseIf:
#     else if ((ch <= 'f') && (ch >= 'a'))
#     {
cmpb $'f', ch
jnb else
cmpb $'a', ch
jb else
#       write(1, &ch, 1);
movl $4, %eax
movl $1, %ebx
movl $ch, %ecx
movl $4, %edx
int $0x80
#       num = num + num;
movl num, %eax
addl %eax, num
#       num = num + num;
movl num, %eax
addl %eax, num
#       num = num + num;
movl num, %eax
addl %eax, num
#       num = num + num;
movl num, %eax
addl %eax, num
#       num = num + ch + 10 - 'a';
movl num, %eax
addl ch, %eax
addl $10 - 'a', %eax
movl %eax, num
#     }
#     else
jmp endOuterIf
else:
#     {
#       ch = 10;
movb $10, ch
#       write(1, &ch, 1);
movl $4, %eax
movl $1, %ebx
movl $ch, %ecx
movl $4, %edx
int $0x80
#       result = 0;
movl $0, result
#     }
#   }
endOuterIf:
# } while (result);
cmpl $0, result
jnz loopStart

movl $1, %eax
movl $0, %ebx
int $0x80

