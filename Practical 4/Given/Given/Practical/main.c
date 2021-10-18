#include <stdlib.h>
#include <stdio.h>

extern int64_t funct(int64_t);

int main(int argc, char** argv)
{    
    printf("%ld, %ld\n", 1, funct(1));
    printf("%ld, %ld\n", 6, funct(6));
    return 0;
}

/*

1, 2
3, 36

 */
