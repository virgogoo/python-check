// checkpy.c
#include <stdio.h>
#include <stdlib.h>

int main() {
    FILE *fp = popen("python3.9 --version 2>&1", "r");
    if (fp == NULL) {
        printf("Error: Python 3.9 not found\n");
        return 1;
    }

    char buffer[128];
    if (fgets(buffer, sizeof(buffer), fp) != NULL) {
        printf("Detected Python Version: %s", buffer);
        FILE *log = fopen("/tmp/python_ver.log", "w");
        if (log) {
            fprintf(log, "%s", buffer);
            fclose(log);
        }
    } else {
        printf("Error: Python 3.9 not found\n");
        return 1;
    }

    pclose(fp);
    return 0;
}
