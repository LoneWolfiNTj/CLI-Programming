#Test Directory Make File
#Written Saturday August 9, 2003 by Robbie Hatley.
#Edit history:
#   Sun May 02, 2004
#   Fri May 27, 2005
#   Wed Aug 10, 2005 - Added prefix-test and ELESSAR
#   Tue Sep 20, 2005 - Dramatically simplified.
#   Thu Oct 19, 2017 - Altered for new file system.
#   Sat Jan 08, 2022: Updated for Linux.

# Set collection name:
COLLECTION := Test

# Set the exe directory so that gcc & g++ know where to write to:
EXSUFF := test

# Set source vpath directories so that make can find the c and cpp files for this collection:
vpath %.c   /d/rhe/src/test
vpath %.cpp /d/rhe/src/test

# ALL        = list of all *.exe files corresponding to the *.c and *.cpp files in current directory.
# C_PROGRAMS = list of all *.exe files corresponding to the *.c           files in current directory.
# X_PROGRAMS = list of all *.exe files corresponding to the         *.cpp files in current directory.
ALL        = $(shell make-all-list.pl)
C_PROGRAMS = $(shell make-c-list.pl)
X_PROGRAMS = $(shell make-x-list.pl)

#  ****************************************************************************
#  *                                                                          *
#  *  (All the actual compilation is done via the pattern rules in maketail.) *
#  *                                                                          *
#  ****************************************************************************

# Include maketail:
include /d/rhe/src/maketail
