#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>

// We need a BIG array!!!
#define ARRAY_SIZE 10000000

int main (void)
{
   // Make this array "static", else stack will overflow!
   static int MyBigArray [ARRAY_SIZE] = {0};

   // We need an iterator:
   size_t i = 0;

   // Seed the random number generator:
   srand((unsigned)time(NULL));

   // Load 1 million random ints into array:
   for ( i = 0 ; i < ARRAY_SIZE ; ++i )
   {
      MyBigArray[i] = rand();
   }

   // Print buffer contents:
   for ( i = 0 ; i < ARRAY_SIZE ; ++i )
   {
      printf("%d\n", MyBigArray[i]);
   }

   // We're done, so exit:
   return 0;
}
