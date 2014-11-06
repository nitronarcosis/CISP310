# uint32 result;
# uint8 ch;
# uint32 num;
# uint32 power;
#
# do
# {
#   result = read(0, &ch, 1);
#   if (result)
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
# } while (result);
# 
