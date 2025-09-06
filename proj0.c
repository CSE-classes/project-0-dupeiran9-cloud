#include "types.h"
#include "user.h"

int
main(int argc, char *argv[])
{
    int i = 0;

    printf(1, "CS350 proj0 print in user space: ");
    
    for (i = 1; i < argc; i++)
    {
        printf(1, argv[i]);
        printf(1, " ");
    }

    printf(1, "\n");
    
    exit();
}
