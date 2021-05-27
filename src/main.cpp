//
//

#include <stdio.h>
#include <stdlib.h>
#include "head.h"

static int array[10];

void func01(void) {
    array[10] = 5;
    return;
}

void func02(void) {
    return;
}

void func03(void) {
    return;
}

int main(void) {
    int a = 0;
    int b = 0;
    int c = 0;
    c = a/b;
    printf("hello=%d\n", c);
    exit(0);
}

