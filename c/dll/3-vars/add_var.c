/* add_var.c

   Demonstrates creating a DLL with an exported function and imported variables.
*/

#include "add_var.h"

int ADDCALL Add(int a, int b)
{
  return (a + b);
}

/* Assign value to exported variables. */
int foo = 7;
int bar = 41;
