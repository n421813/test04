//
//

#include <stdio.h>
#include <stdlib.h>
#include "head.h"

static int array[10];

void func01(void) {
    // 範囲外アクセス
    array[10] = 5;
    return;
}

void func02(void) {
    // ゼロ割
    int a = 0;
    int b = 0;
    int c = 0;
    c = a/b;
    printf("hello=%d\n", c);
    return;
}

void func03(void) {
    // nullポインタ
    int *p = nullptr;
    *p = 123U;
    return;
}

int main(void) {
    func01();
    func02();
    func03();
    exit(0);
}

