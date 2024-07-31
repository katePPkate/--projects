#include "cat.h"

int main(int argc, char **argv) {
  cat(argc, argv);
  return 0;
}

void cat(int argc, char **argv) {
  if (argc > 1) {
    elements state = {0};
    if (scanelements(argc, argv, &state)) {
      for (int x = argc - state.countFiles; x < argc; x += 1) {
        FILE *file = fopen(argv[x], "r");
        if (file != NULL) {
          printData(file, &state);
          fclose(file);
        } else
          fprintf(stderr, ERROR_1, argv[x]);
      }
    }
  }
}

int scanelements(int argc, char **argv, elements *state) {
  int indexStartFiles = 1, status = 1;
  for (int x = 1; (x < argc && argv[x][0] == '-'); indexStartFiles = (x += 1)) {
    char *arg = argv[x];
    for (int i = 1; arg[i] != '\0'; i++) {
      if (arg[1] != '-') {
        switch (arg[i]) {
          case 'b':
            state->b = (state->n = 0) + 1;
            break;
          case 's':
            state->s = 1;
            break;
          case 'n':
            state->n = state->b ? 0 : 1;
            break;
          case 'T':
            state->t = 1;
            break;
          case 'v':
            state->v = 1;
            break;
          case 't':
            state->t = 1;
            state->v = 1;
            break;
          case 'e':
            state->e = 1;
            state->v = 1;
            break;
          case 'E':
            state->e = 1;
            break;
          default:
            status = 0;
        }
      } else {
        if (!strcmp(argv[x], "--number-nonblank")) {
          state->b = (state->n = 0) + 1;
        } else if (!strcmp(argv[x], "--squeeze-blank")) {
          state->s = 1;
        } else if (!strcmp(argv[x], "--number")) {
          state->n = state->b ? 0 : 1;
        } else if (!strcmp(argv[x], "-T")) {
          state->t = 1;
        } else if (!strcmp(argv[x], "-E")) {
          state->e = 1;
        } else {
          status = 0;
        }
      }
    }
  }
  if (!status) {
    fprintf(stderr, ERROR_2);
  }
  state->countFiles = argc - indexStartFiles;
  return status;
}

void printData(FILE *file, elements *state) {
  int empty = 0, countB = 0;
  int beforeEmpty = 0;
  int countN = 0;
  int countSym = 0;
  char c = '\n';
  for (char symbol = '0'; (symbol = getc(file)) != EOF;) {
    if (symbol != '\n') {
      empty = 0;
      if (c == '\n') {
        countSym = 1;
        countB += 1;
        countN++;
      } else {
        countSym++;
      }
    } else {
      if (c == '\n') {
        countSym = 1;
        empty = 1;
        countN += 1;
      }
      countSym++;
    }

    if (state->s && empty == 1 && beforeEmpty == 1) {
      countN -= 1;
      continue;
    }

    if (state->b && countSym == 1 && !empty) {
      printf("%6d\t", countB);
    }

    if (state->b && state->e && countSym == 1 && empty) {
      printf("       \t");
    }

    if (state->n && c == '\n') {
      printf("%6d\t", countN);
    }

    if (state->e && symbol == '\n') {
      if (empty && state->b) {
        printf("        $");
      } else {
        printf("$");
      }
    }

    if (state->v) {
      if (symbol < 32 && symbol != 9 && symbol != 10)
        if (symbol += 64) printf("^");
      if (symbol == 127)
        if ((symbol = '?')) printf("^");
    }

    if (state->t && symbol == '\t')
      if ((symbol = 'I')) printf("^");

    printf("%c", symbol);
    c = symbol;
    beforeEmpty = empty;
  }
}
