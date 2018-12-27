function ucgenFISGiris(altsinir,a,c,b,ustsinir,giris)

global mu_giris CIKIS mu_CIKIS;
alfa=1;

if giris>=a && giris<=c
    mu_giris = alfa*(giris-a)/(c-a);
elseif giris>c && giris<=b
    mu_giris = alfa*(giris-b)/(c-b);
else
    mu_giris = 0;
    
end