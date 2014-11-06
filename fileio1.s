.data
# uint32 result;
result: .fill 32
# uint8 ch;
ch: .fill 8
# uint32 num;
num: .fill 32
# uint32 power;
power: .fill 32
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
movl $result, %ecx
movl $32, %edx
movl %eax, result
#   if (result)
cmpl $0, %eax
jz endOuterIf
#   {
#     if ((ch <= '9') && (ch >= '0'))

#     {
#       write(1, &ch, 1);
#       num = num + num;
#       num = num + num;
#       num = num + num;
#       num = num + num;
#       num = num + ch - '0';
#     }
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

