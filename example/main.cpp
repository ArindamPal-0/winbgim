#include <graphics.h>

int main()
{
    int gdriver = DETECT, gmode;
    initgraph(&gdriver, &gmode, (char*)"");
    line(200, 200, 300, 300);
    getch();
    closegraph();
}