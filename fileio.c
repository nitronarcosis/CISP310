#include <unistd.h>
#include <stdint.h>

int main(void)
{
 uint32_t result;
 uint8_t ch;
 uint32_t num = 0;
 uint32_t power;

 do
 {
   result = read(0, &ch, 1);
   if (result)
   {
     if ((ch <= '9') && (ch >= '0'))
     {
       write(1, &ch, 1);
       num = num + num;
       num = num + num;
       num = num + num;
       num = num + num;
       num = num + ch - '0';
     }
     else if ((ch <= 'f') && (ch >= 'a'))
     {
       write(1, &ch, 1);
       num = num + num;
       num = num + num;
       num = num + num;
       num = num + num;
       num = num + ch + 10 - 'a';
     }
     else
     {
       ch = 10;
       write(1, &ch, 1);
       result = 0;
     }
   }
 } while (result);
 
return 0;
}
