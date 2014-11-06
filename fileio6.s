.data
# uint32 result;
result: .fill 4 
# uint8 ch;
ch: .fill 1
# uint32 num;
num: .fill 4
# uint32 power;
power: .fill 4
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
#   if (result)
cmpl $0, %eax
jz endOuterIf
#   {
#     if ((ch <= '9') && (ch >= '0'))
cmpb $0, ch
jb endInnerIf
cmpb $10, ch
jnb endInnerIf
#     {
#       write(1, &ch, 1);
movl $4, %eax
movl $1, %ebx
movl $ch, %ecx
movl $4, %edx
#       num = num + num;
#       num = num + num;
#       num = num + num;
#       num = num + num;
movl $16, %eax
mull num
#       num = num + ch - '0';
addl (ch), num
subl $'0', num
#     }
endInnerIf:
#     else if ((ch <= 'f') && (ch >= 'a'))
#     {
#       write(1, &ch, 1);
#       num = num + num;
#       num = num + num;
#       num = num + num;
#       num = num + num;
#       num = num + ch + 10 - 'a';
#     }
#     else
#     {
#       ch = 10;
#       write(1, &ch, 1);
#       result = 0;
#     }
#   }
endOuterIf:
# } while (result);

