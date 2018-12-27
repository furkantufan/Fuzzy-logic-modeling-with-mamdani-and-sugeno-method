function YamukFISCikis(altsinir,a,c,d,b,ustsinir)
global mu_giris CIKIS mu_CIKIS;

alfa=1; 
X1=altsinir:0.001:a-0.001; 
X2=a:0.001:c-0.001;
X3=c:0.001:d-0.001;
X4=d:0.001:b-0.001;
X5=b:0.001:ustsinir;

mu_X1=zeros(size(X1));
mu_X2=alfa*(X2-a)/(c-a);
mu_X3=alfa*ones(size(X3));
mu_X4=alfa*(X4-b)/(d-b);
mu_X5=zeros(size(X5));

CIKIS=[X1 X2 X3 X4 X5];
mu_CIKIS=[mu_X1 mu_X2 mu_X3 mu_X4 mu_X5];


