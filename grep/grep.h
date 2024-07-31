#ifndef GREP
#define GREP

#include <getopt.h>
#include <regex.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
  int e;
  int i;
  int v;
  int c;
  int l;
  int n;
  int h;
  int s;
  int f;
  int o;
  int countFiles;
  int numberLine;
  int countMatches;
} elements;

void grep(int argc, char **argv);

int scanelements(int argc, char **argv, elements *state, char **pattern);
void setstateF(elements *state, char **template, char *optarg);

void outLine(char *str, elements *elements, char *tmpl, char *name);

void outState(regex_t my_regex, char *str, elements state);
void search(char *name, elements state, char *tmpl);
void outPath(elements state, char *path);
int Pattern(char **str, char *optarg, int create);

#endif
