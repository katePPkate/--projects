#include "s21_string.h"

void *s21_memchr(const void *str, int c, s21_size_t n) {
  const unsigned char *ptr = (const unsigned char *)str;
  void *result = s21_NULL;
  s21_size_t i = 0;
  while (i < n && result == s21_NULL) {
    if (*ptr == (unsigned char)c) {
      result = (void *)ptr;
    }
    ptr++;
    i++;
  }
  return result;
}

int s21_memcmp(const void *str1, const void *str2, s21_size_t n) {
  const unsigned char *s1 = (const unsigned char *)str1;
  const unsigned char *s2 = (const unsigned char *)str2;
  int result = 0;
  for (s21_size_t i = 0; i < n && result == 0; i++, s1++, s2++) {
    int delta = *s1 - *s2;
    if (delta != 0) {
      result = delta;
    }
  }
  return result;
}

void *s21_memcpy(void *dest, const void *src, s21_size_t n) {
  unsigned char *d = (unsigned char *)dest;
  const unsigned char *s = (const unsigned char *)src;
  s21_size_t i = 0;
  while (i < n) {
    d[i] = s[i];
    i++;
  }
  return dest;
}

void *s21_memset(void *str, int c, s21_size_t n) {
  unsigned char *s = (unsigned char *)str;
  s21_size_t i = 0;
  while (i < n) {
    s[i] = (unsigned char)c;
    i++;
  }
  return str;
}

void *s21_memmove(void *dest, const void *src, s21_size_t n) {
  unsigned char *d = (unsigned char *)dest;
  const unsigned char *s = (const unsigned char *)src;

  if (d < s) {
    for (s21_size_t i = 0; i < n; i++) {
      d[i] = s[i];
    }
  } else {
    for (s21_size_t i = n; i > 0; i--) {
      d[i - 1] = s[i - 1];
    }
  }

  return dest;
}

char *s21_strncat(char *dest, const char *src, s21_size_t n) {
  char *d = dest;
  while (*d) {
    d++;
  }
  s21_size_t i = 0;
  while (i < n && *src) {
    *d++ = *src++;
    i++;
  }
  *d = '\0';
  return dest;
}

char *s21_strchr(const char *str, int c) {
  char *result = s21_NULL;
  while (*str && result == s21_NULL) {
    if (*str == (char)c) {
      result = (char *)str;
    }
    str++;
  }
  if (*str == (char)c) {
    result = (char *)str;
  }
  return result;
}

int s21_strncmp(const char *str1, const char *str2, s21_size_t n) {
  int result = 0;
  s21_size_t i = 0;
  while (i < n && result == 0) {
    if (str1[i] != str2[i]) {
      result = (unsigned char)str1[i] - (unsigned char)str2[i];
    }
    if (str1[i] == '\0') {
      break;
    }
    i++;
  }
  return result;
}

char *s21_strncpy(char *dest, const char *src, s21_size_t n) {
  char *d = dest;
  s21_size_t i = 0;
  while (i < n && (*d++ = *src++)) {
    i++;
  }
  while (i < n) {
    *d++ = '\0';
    i++;
  }
  return dest;
}

s21_size_t s21_strcspn(const char *str1, const char *str2) {
  s21_size_t length = 0;
  while (*str1 && s21_strchr(str2, *str1) == s21_NULL) {
    str1++;
    length++;
  }
  return length;
}

s21_size_t s21_strlen(const char *str) {
  s21_size_t len = 0;
  if (str != s21_NULL) {
    while (str[len] != '\0') {
      len++;
    }
  } else {
    len = 0;
  }
  return len;
}

char *s21_strpbrk(const char *str1, const char *str2) {
  char *result = s21_NULL;
  while (*str1 && result == s21_NULL) {
    if (s21_strchr(str2, *str1)) {
      result = (char *)str1;
    }
    str1++;
  }
  return result;
}

char *s21_strrchr(const char *str, int c) {
  char *result = s21_NULL;
  while (*str) {
    if (*str == (char)c) {
      result = (char *)str;
    }
    str++;
  }
  if (c == '\0') {
    result = (char *)str;
  }
  return result;
}

char *s21_strstr(const char *haystack, const char *needle) {
  char *result = s21_NULL;

  if (*needle == '\0') {
    result = (char *)haystack;
  } else {
    while (*haystack && result == s21_NULL) {
      const char *h = haystack;
      const char *n = needle;

      while (*h && *n && (*h == *n)) {
        h++;
        n++;
      }

      if (*n == '\0') {
        result = (char *)haystack;
      }
      haystack++;
    }
  }
  return result;
}

s21_size_t s21_strspn(const char *str, const char *delim) {
  const char *s = str;
  while (*s && s21_strchr(delim, *s)) {
    s++;
  }
  return s - str;
}

char *s21_strtok(char *str, const char *delim) {
  static char *next_token = s21_NULL;
  char *result = s21_NULL;

  if (str == s21_NULL) {
    str = next_token;
  }

  if (str) {
    str += s21_strspn(str, delim);

    if (*str != '\0') {
      result = str;
      str += s21_strcspn(str, delim);
      if (*str != '\0') {
        *str = '\0';
        str++;
      }
      next_token = str;
    } else {
      next_token = s21_NULL;
    }
  }

  return result;
}

void *s21_to_upper(const char *str) {
  unsigned long long len = s21_strlen(str);
  char *result = calloc(len + 1, 1);
  for (unsigned long long i = 0; i < len; i++) {
    if (str[i] < 'a' || str[i] > 'z') {
      result[i] = str[i];
    } else {
      result[i] = str[i] - 32;
    }
  }
  result[len] = '\0';
  return result;
}

void *s21_to_lower(const char *str) {
  unsigned long long len = s21_strlen(str);
  char *result = calloc(len + 1, 1);
  for (unsigned long long i = 0; i < len; i++) {
    if (str[i] < 'A' || str[i] > 'Z') {
      result[i] = str[i];
    } else {
      result[i] = str[i] + 32;
    }
  }
  result[len] = '\0';
  return result;
}

void *s21_insert(const char *src, const char *str, s21_size_t start_index) {
  char *result = s21_NULL;
  s21_size_t len_of_src = 0;
  s21_size_t len_of_str = 0;
  s21_size_t len_of_result = 0;
  if (src != s21_NULL && str != s21_NULL) {
    len_of_src = s21_strlen(src);
    len_of_str = s21_strlen(str);
    len_of_result = len_of_src + len_of_str;
  }

  if (start_index <= len_of_src) {
    result = (char *)calloc(len_of_result + 1, sizeof(char));
  }
  if (result) {
    for (s21_size_t i = 0; i < len_of_result; i++) {
      if (i < start_index) {
        result[i] = src[i];
      } else if (i < len_of_str + start_index) {
        result[i] = str[i - start_index];
      } else {
        result[i] = src[i - len_of_str];
      }
    }
  }
  return result;
}

void *s21_trim(const char *src, const char *trim_chars) {
  char *result = s21_NULL;
  if (src) {
    s21_size_t len = s21_strlen(src);
    if (trim_chars && trim_chars[0]) {
      result = calloc(len + 1, 1);
      s21_size_t start = 0, end = len;
      while (s21_Start(src, trim_chars, start)) start++;
      if (start != end) {
        while (s21_End(src, trim_chars, end)) end--;
      } else {
        result[0] = '\0';
      }
      for (int i = 0; start < end; i++) {
        result[i] = src[start];
        start++;
      }
    } else {
      result = s21_trim(src, "\t\n ");
    }
  }
  return result;
}

int s21_Start(const char *src, const char *trim_chars, int start) {
  int result = 0;
  int len = s21_strlen(trim_chars);
  for (int i = 0; i < len; i++) {
    if (src[start] == trim_chars[i]) result = 1;
  }
  return result;
}

int s21_End(const char *src, const char *trim_chars, int end) {
  int result = 0;
  end--;
  int len = s21_strlen(trim_chars);
  for (int i = 0; i < len; i++) {
    if (src[end] == trim_chars[i]) result = 1;
  }
  return result;
}

char *s21_strcpy(char *dest, const char *src) {
  char *d = dest;
  while ((*d++ = *src++) != '\0');
  return dest;
}
