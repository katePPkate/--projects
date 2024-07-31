#include "grep.h"

int main(int argc, char **argv) {
  grep(argc, argv);
  return 0;
}

void grep(int argc, char **argv) {
  if (argc > 1) {
    char *pattern = NULL;
    elements state = {0};
    for (int x = scanelements(argc, argv, &state, &pattern); x < argc; x += 1)
      search(argv[x], state, pattern);
    if (pattern != NULL) free(pattern);
  }
}

int scanelements(int argc, char **argv, elements *state, char **pattern) {
  for (int symbol = 0; symbol != -1;) {
    symbol = getopt(argc, argv, "e:ivclnhsf:o");
    switch (symbol) {
      case 'i':
        state->i = 1;
        break;
      case 'v':
        state->v = 1;
        break;
      case 'c':
        state->c = 1;
        break;
      case 'l':
        state->l = 1;
        state->h = 0;
        break;
      case 'n':
        state->n = 1;
        break;
      case 'h':
        if (!state->l) {
          state->h = 1;
        }
        break;
      case 's':
        state->s = 1;
        break;
      case 'o':
        state->o = 1;
        break;
      case 'e':
        if (!(state->e || state->f))
          state->e = Pattern(pattern, optarg, 1);
        else
          Pattern(pattern, optarg, 0);
        break;
      case 'f':
        setstateF(state, pattern, optarg);
        break;
    }
  }
  if ((state->e || state->f) == 0) {
    Pattern(pattern, argv[optind], 1);
    optind += 1;
  }
  if (state->o && (state->l || state->v || state->c)) state->o = 0;
  state->countFiles = argc - optind;
  return optind;
}

void setstateF(elements *state, char **pattern, char *optarg) {
  FILE *file = fopen(optarg, "r");
  if (file != NULL) {
    char symbol = getc(file);
    for (; symbol != EOF;) {
      symbol = getc(file);
      int length = 0;
      char *line = calloc(256, 1);

      for (line[length] = '\0'; symbol != EOF && symbol != '\n';
           symbol = getc(file)) {
        line[length] = symbol;
        length += 1;
        line[length] = '\0';
        if (length % 255 == 0) {
          line = (char *)realloc(line, length + 256);
        }
      }
      if (!(state->e || state->f))
        state->f = Pattern(pattern, line, 1);
      else
        Pattern(pattern, line, 0);
      free(line);
    }
    fclose(file);
  } else if (state->s == 0) {
    fprintf(stderr, "ERROR");
  }
}

int Pattern(char **str, char *optarg, int create) {
  if (create) {
    *str = calloc(strlen(optarg) + 1, 1);
    if (*str) strcpy(*str, optarg);
  } else {
    *str = realloc(*str, strlen(*str) + strlen(optarg) + 2);
    if (*str) strcat(strcat(*str, "|"), optarg);
  }
  return str ? 1 : 0;
}

void search(char *path, elements state, char *pattern) {
  FILE *file = fopen(path, "r");
  if (file != NULL) {
    for (char symbol = '0'; symbol != EOF;) {
      symbol = getc(file);
      char *line = calloc(256, 1);
      state.numberLine += 1;
      int length = 0;
      for (line[length] = '\0'; symbol != EOF && symbol != '\n';
           symbol = getc(file)) {
        line[length] = symbol;
        length++;
        line[length] = '\0';
        if (length % 255 == 0) {
          line = realloc(line, length + 256);
        }
      }
      outLine(line, &state, pattern, path);
      free(line);
    }
    outPath(state, path);
    fclose(file);
  } else if (state.s == 0) {
    fprintf(stderr, "ERROR");
  }
}

void outPath(elements state, char *path) {
  if (state.c) {
    if (state.l) {
      if (state.countFiles > 1) {
        if (state.countMatches > 0) {
          printf("%s:1\n", path);
        } else {
          printf("%s:0\n", path);
        }

      } else {
        state.countMatches > 0 ? printf("1\n") : printf("0\n");
      }
    } else {
      if (state.countFiles > 1 && !state.h) printf("%s:", path);
      printf("%i\n", state.countMatches);
    }
  }
  if (state.l && state.countMatches) {
    printf("%s\n", path);
  }
}

void outLine(char *line, elements *state, char *pattern, char *path) {
  regex_t regex;
  if (regcomp(&regex, pattern, state->i ? REG_ICASE : REG_EXTENDED) == 0) {
    if (regexec(&regex, line, 0, NULL, 0) == state->v) {
      state->countMatches += 1;
      if ((state->c || state->l) == 0) {
        if (state->countFiles > 1 && !(state->h)) printf("%s:", path);
        if (state->n) printf("%i:", state->numberLine);
        if (!state->o)
          printf("%s\n", line);
        else
          outState(regex, line, *state);
      }
    }
    regfree(&regex);
  }
}

void outState(regex_t regex, char *line, elements state) {
  while (regexec(&regex, line, 0, NULL, 0) == state.v) {
    char *working_copy = (char *)calloc(strlen(line) + 1, 1);
    strcpy(working_copy, line);
    int end_index = strlen(line);
    while (regexec(&regex, working_copy, 0, NULL, 0) == state.v) {
      end_index--;
      working_copy[strlen(working_copy) - 1] = '\0';
    }
    working_copy[strlen(working_copy)] = line[strlen(working_copy)];
    int start_index = 0;
    while (regexec(&regex, working_copy, 0, NULL, 0) == state.v &&
           strlen(working_copy) > 0) {
      start_index++;
      int j = 0;
      while (working_copy[j] != '\0') {
        working_copy[j] = working_copy[j + 1];
        j++;
      }
    }
    start_index--;
    int i = strlen(working_copy);
    while (i != 0) {
      working_copy[i] = working_copy[i - 1];
      i--;
    }
    working_copy[0] = line[start_index];
    printf("%s\n", working_copy);
    free(working_copy);
    i = start_index + 1;
    while (line[i] != '\0') {
      line[i - start_index - 1] = line[i];
      i++;
    }
    line[i - start_index - 1] = '\0';
  }
}
