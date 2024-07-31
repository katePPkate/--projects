#ifndef CAT
#define CAT
#define _GNU_SOURCE

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define ERROR_1 "%s: No such file or directory\n"
#define ERROR_2 "invalid flag \n"

typedef struct {
  int b;
  int e;
  int n;
  int s;
  int t;
  int v;
  int countFiles;
} elements;

void cat(int argc, char **argv);
int scanelements(int argc, char **argv, elements *state);
void printData(FILE *file, elements *state);
#endif
