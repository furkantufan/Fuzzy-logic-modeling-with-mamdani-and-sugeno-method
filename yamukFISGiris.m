function yamukFISGiris(altsinir,a,c,d,b,ustsinir,xi)
global mu_giris CIKIS mu_CIKIS;
alfa=1;

if xi>=a && xi<=c
    mu_giris = alfa*(xi-a)/(c-a);
elseif xi>=c && xi<=d
    mu_giris = alfa;
elseif xi>=d && xi<=b 
    mu_giris = alfa*(xi-b)/(d-b);
else
    mu_giris = 0;
end