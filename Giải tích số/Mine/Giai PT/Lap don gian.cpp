#include <stdio.h>
#include <conio.h>
#include <math.h>
float g(float x)
{
    return pow(x + 1, 1.0/3);  	   // nhap ham g(x)
}
int main()
{
    float eps, x0, x, q;
    int n, i = 1;
    printf("Giai PT bang phuong phap lap don gian\n")
    printf("Nhap sai so epsilon: ");
    scanf("%f", &eps);
    printf("Nhap gia tri xap xi dau x0: ");
    scanf("%f", &x0);
    printf("Nhap q: ");
    scanf("%f", &q);
    printf("Nhap so lan lap toi da: ");
    scanf("%d", &n);
    x = g(x0);
    if(q != 0)
    {
        eps = eps * (1 - q) / q;
        while(i <= n && fabs(x - x0) >= eps)
        {
            x0 = x;
            x = g(x0);
            i++;
        }
        i--;
    }
    printf("\nNghiem gan dung la: x = %f", x);
    printf("\nSo lan lap la: %d", i);
    getch();
return 0;
}
