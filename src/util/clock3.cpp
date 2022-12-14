// This is a 79-character-wide utf-8-encoded C++ source-code text file.  
// ¡Hablo Español!  Говорю Русский.  Björt skjöldur.  麦藁雪、富士川町、山梨県。  
//=======|=========|=========|=========|=========|=========|=========|=========

// clock3.cpp
// Written by Robbie Hatley at unknown date in the past.
// (Can't call it "time.cpp" because that conflicts with DOS "time" command.)
// Displays time and date.  A rather crude program.  Not much compared to my
// clock.cpp and clock2.cpp programs.
// Last edited Saturday May 3, 2003.

#include <iostream>
#include <stdlib.h>
#include <string.h>
#include <time.h>

using std::cout;
using std::endl;

std::string GetTimeString()
{
  // Get calendar time:
  time_t caltime;   // variable to hold calendar time
  time(&caltime);   // Assign time to caltime using std. lib. "time" function.
   
  // Generate struct tm structured version of caltime:
  struct tm StructuredTime;               // variable to hold structured time
  StructuredTime = *localtime(&caltime);  // Load structure.
  
  // Make C-string and load with formatted time:
  static char FormattedTime[51] = {'\0'};
  strftime(FormattedTime, 50, "%I:%M%p, %A %B %d, %Y\n", &StructuredTime);
  
  // Convert to C++ style string and return this string:
  std::string Time = FormattedTime;
  return Time;
}

int main(void)
{
  cout << GetTimeString() << endl;
  return 0;
}
