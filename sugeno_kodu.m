global mu_giris

altsinir_buyukluk=0; ustsinir_buyukluk=40;
altsinir_tazelik=0; ustsinir_tazelik=20;

X = altsinir_buyukluk:ustsinir_buyukluk;
Y = altsinir_tazelik:ustsinir_tazelik;
buyukluk_degeri =32;
tazelik_degeri=20;


c1=8; c2=25; c3=45; c4=65; c5=91;

for i=1:size(X,2)
    for j=1:size(Y,2)
        toplam_agirlik = 0;
buyukluk_degeri=X(i); tazelik_degeri=Y(j);


%buyukluk fonksiyonunun girisleri
yamukFISGiris(altsinir_buyukluk,0, 0, 10, 25,ustsinir_buyukluk,buyukluk_degeri); mu_xi_cok_kucuk = mu_giris;
ucgenFISGiris(altsinir_buyukluk,15, 20, 25,ustsinir_buyukluk,buyukluk_degeri);mu_xi_kucuk=mu_giris;
ucgenFISGiris(altsinir_buyukluk,20, 25, 30,ustsinir_buyukluk,buyukluk_degeri);mu_xi_ortab=mu_giris;
ucgenFISGiris(altsinir_buyukluk,25, 30, 35,ustsinir_buyukluk,buyukluk_degeri);mu_xi_iyib=mu_giris;
yamukFISGiris(altsinir_buyukluk,30, 35, 40, 40,ustsinir_buyukluk,buyukluk_degeri);mu_xi_buyuk=mu_giris;

%tazelik fonksiyonunun girisleri

yamukFISGiris(altsinir_tazelik,0, 0, 6, 8,ustsinir_tazelik,tazelik_degeri); mu_yi_curuk = mu_giris;
ucgenFISGiris(altsinir_tazelik,5, 10, 15,ustsinir_tazelik,tazelik_degeri);mu_yi_orta_tazelik = mu_giris;
yamukFISGiris(altsinir_tazelik,12, 15, 20, 20,ustsinir_tazelik,tazelik_degeri); mu_yi_taze = mu_giris;


z1=c1; z2=c2; z3=c3; z4=c4; z5=c5; 


mu_k1 = min (mu_xi_cok_kucuk,mu_yi_curuk);
mu_k2 = min (mu_xi_cok_kucuk,mu_yi_orta_tazelik);
mu_k3 = min (mu_xi_cok_kucuk,mu_yi_taze);

mu_k4 = min (mu_xi_kucuk,mu_yi_curuk);
mu_k5 = min (mu_xi_kucuk,mu_yi_orta_tazelik);
mu_k6 = min (mu_xi_kucuk,mu_yi_taze);

mu_k7 = min (mu_xi_ortab,mu_yi_curuk);
mu_k8 = min (mu_xi_ortab,mu_yi_orta_tazelik);
mu_k9 = min (mu_xi_ortab,mu_yi_taze);

mu_k10 = min (mu_xi_iyib,mu_yi_curuk);
mu_k11 = min (mu_xi_iyib,mu_yi_orta_tazelik);
mu_k12 = min (mu_xi_iyib,mu_yi_taze);

mu_k13 = min (mu_xi_buyuk,mu_yi_curuk);
mu_k14 = min (mu_xi_buyuk,mu_yi_orta_tazelik);
mu_k15 = min (mu_xi_buyuk,mu_yi_taze);

mu_s1 = mu_k1 * z1;
mu_s2 = mu_k2 * z1;
mu_s3 = mu_k3 * z3;

mu_s4 = mu_k4 * z1;
mu_s5 = mu_k5 * z2;
mu_s6 = mu_k6 * z3;

mu_s7 = mu_k7 * z2;
mu_s8 = mu_k8 * z3;
mu_s9 = mu_k9 * z4;

mu_s10 = mu_k10 * z2;
mu_s11 = mu_k11 * z3;
mu_s12 = mu_k12 * z5;

mu_s13 = mu_k13 * z3;
mu_s14 = mu_k14 * z4;
mu_s15 = mu_k15 * z5;

SAT=mu_s1+mu_s2+mu_s3+mu_s4+mu_s5+mu_s6+mu_s7+mu_s8+mu_s9+mu_s10+mu_s11+mu_s12+mu_s13+mu_s14+mu_s15;

toplam_agirlik = mu_k1+mu_k2+mu_k3+mu_k4+mu_k5+mu_k6+mu_k7+mu_k8+mu_k9+mu_k10+mu_k11+mu_k12+mu_k13+mu_k14+mu_k15;

if toplam_agirlik == 0 
    'Agirlik merkezi yönt. toplam alan sifir';
end


z(j,i) = SAT/toplam_agirlik
    end
end

[X,Y] = meshgrid(X,Y);
surf(X,Y,z);
xlabel('x');
xlabel('y');
xlabel('z');





