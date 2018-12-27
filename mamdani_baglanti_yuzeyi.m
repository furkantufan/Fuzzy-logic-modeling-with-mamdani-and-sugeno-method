global mu_giris CIKIS mu_CIKIS;

altsinir_buyukluk=0; ustsinir_buyukluk=40;
altsinir_tazelik=0; ustsinir_tazelik=20;
altsinir_kalite=0; ustsinir_kalite=100;

X=altsinir_buyukluk:ustsinir_buyukluk;
Y=altsinir_tazelik:ustsinir_tazelik;

buyukluk_degeri=22;
tazelik_degeri=10;

for i=1:size(X,2)
    for j=1:size(Y,2)
         
        buyukluk_degeri=X(i);tazelik_degeri=Y(j);

%buyukluk uyelik fonksiyonu

yamukFISGiris(altsinir_buyukluk,0, 0, 10, 25,ustsinir_buyukluk,buyukluk_degeri);%cok kucuk grafigi
mu_xi_cok_kucuk = mu_giris;

ucgenFISGiris(altsinir_buyukluk,15, 20, 25,ustsinir_buyukluk,buyukluk_degeri); %kucuk grafigi
mu_xi_kucuk = mu_giris;

ucgenFISGiris(altsinir_buyukluk,20, 25, 30,ustsinir_buyukluk,buyukluk_degeri);% orta grafigi
mu_xi_ortab = mu_giris;

ucgenFISGiris(altsinir_buyukluk,25, 30, 35,ustsinir_buyukluk,buyukluk_degeri);% iyi grafigi
mu_xi_iyib = mu_giris;

yamukFISGiris(altsinir_buyukluk,30, 35, 40, 40,ustsinir_buyukluk,buyukluk_degeri);% buyuk grafigi
mu_xi_buyuk = mu_giris;



%tazelik uyelik fonksiyon
yamukFISGiris(altsinir_tazelik,0, 0, 6, 8,ustsinir_tazelik,tazelik_degeri);% zayif grafigi
mu_yi_curuk = mu_giris;
ucgenFISGiris(altsinir_tazelik,5, 10, 15,ustsinir_tazelik,tazelik_degeri);% orta_tazelik grafigi
mu_yi_orta_tazelik = mu_giris;
yamukFISGiris(altsinir_tazelik,12, 15, 20, 20,ustsinir_tazelik,tazelik_degeri);% taze grafigi
mu_yi_taze = mu_giris;




%kalite uyelik fonksiyonu
YamukFISCikis(altsinir_kalite,0, 0, 10, 20,ustsinir_kalite);% cokkotu grafigi
Z=CIKIS; mu_cokkotu = mu_CIKIS; 
UcgenFISCikis(altsinir_kalite,10, 25, 40,ustsinir_kalite);% kotu grafigi
mu_kotu = mu_CIKIS;
UcgenFISCikis(altsinir_kalite,30, 45, 60,ustsinir_kalite);% orta grafigi
mu_orta_kalite = mu_CIKIS;
UcgenFISCikis(altsinir_kalite,50, 65, 80,ustsinir_kalite);% iyi grafigi
mu_iyi = mu_CIKIS;
YamukFISCikis(altsinir_kalite,75, 90, 100, 100,ustsinir_kalite);% mukemmel grafigi
mu_cokiyi = mu_CIKIS;



%Kurallar
mu_kural1 = min (mu_xi_cok_kucuk,mu_yi_curuk);
mu_kural2 = min (mu_xi_cok_kucuk,mu_yi_orta_tazelik);
mu_kural3 = min (mu_xi_cok_kucuk,mu_yi_taze);

mu_kural4 = min (mu_xi_kucuk,mu_yi_curuk);
mu_kural5 = min (mu_xi_kucuk,mu_yi_orta_tazelik);
mu_kural6 = min (mu_xi_kucuk,mu_yi_taze);

mu_kural7 = min (mu_xi_ortab,mu_yi_curuk);
mu_kural8 = min (mu_xi_ortab,mu_yi_orta_tazelik);
mu_kural9 = min (mu_xi_ortab,mu_yi_taze);

mu_kural10 = min (mu_xi_iyib,mu_yi_curuk);
mu_kural11 = min (mu_xi_iyib,mu_yi_orta_tazelik);
mu_kural12 = min (mu_xi_iyib,mu_yi_taze);

mu_kural13 = min (mu_xi_buyuk,mu_yi_curuk);
mu_kural14 = min (mu_xi_buyuk,mu_yi_orta_tazelik);
mu_kural15 = min (mu_xi_buyuk,mu_yi_taze);

%gerektirme islemleri
mu_sonuc1 = mu_kural1 * mu_cokkotu;
mu_sonuc2 = mu_kural2 * mu_cokkotu;
mu_sonuc3 = mu_kural3 * mu_orta_kalite;

mu_sonuc4 = mu_kural4 * mu_cokkotu;
mu_sonuc5 = mu_kural5 * mu_kotu;
mu_sonuc6 = mu_kural6 * mu_orta_kalite;

mu_sonuc7 = mu_kural7 * mu_kotu;
mu_sonuc8 = mu_kural8 * mu_orta_kalite;
mu_sonuc9 = mu_kural9 * mu_iyi;

mu_sonuc10 = mu_kural10 * mu_kotu;
mu_sonuc11 = mu_kural11 * mu_orta_kalite;
mu_sonuc12 = mu_kural12 * mu_cokiyi;

mu_sonuc13 = mu_kural13 * mu_orta_kalite;
mu_sonuc14 = mu_kural14 * mu_cokiyi;
mu_sonuc15 = mu_kural15 * mu_cokiyi;

%birlestirme islemi
mu_tmp1 = max(max(mu_sonuc1,mu_sonuc2),max(mu_sonuc3,mu_sonuc4));
mu_tmp2 = max(max(mu_sonuc5,mu_sonuc6),max(mu_sonuc7,mu_sonuc8));
mu_tmp3 = max(max(mu_sonuc9,mu_sonuc10),max(mu_sonuc11,mu_sonuc12));
mu_tmp4 = max(max(mu_sonuc13,mu_sonuc14),max(mu_sonuc15,mu_sonuc15));

mu_birlestirme =  max(max(mu_tmp1,mu_tmp2),max(mu_tmp3,mu_tmp4));
%plot(X,mu_birlestirme);

toplam_alan = sum(mu_birlestirme);

z(j,i) = sum(mu_birlestirme.*Z)/toplam_alan;

    end %j
end %i

[X,Y] = meshgrid(X,Y);
surf(X,Y,z);
xlabel('x');
ylabel('y');
zlabel('z');
































