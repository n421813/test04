//
//

#include <stdio.h>
#include <stdlib.h>
#include "head.h"

void func01(void) {
    int array[10] = {};
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

