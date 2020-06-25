#include <stdio.h>
#include <conio.h>
#include <math.h>
// Thay doi ham f mong muon
float f (float x)
	{
		return pow(x,6)-1;
	}
main()
{
	float a,b,p,n,c;
	printf("Nhap can duoi a: ");
	scanf("%f",&a);
	printf("Nhap can tren b:  ");
	scanf("%f",&b);
	printf("Nhap do chinh xac mong muon: ");
	scanf("%f",&p);
	n=0;
		while(1)
		{
			c=(a+b)/2;
			n++;
			printf("Ket qua o lan lap thu %f la %f \n",n,c);
			//Dòng if này kiem tra do chính xác mong muon;
			if(fabs(a-b)<(2*p)) break;
			if (f(a)*f(c)<0)
			b=c;
			else
			a=c;
		}
	printf("Vay %f la nghiem gan dung",c);
	getch();
}
