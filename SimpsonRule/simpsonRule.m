%%
% Simpson Rule kullanarak bir integralin yaklaşık sonucuna ulaşılması
%%
function integral = simpsonRule(V, h)    
    % Fonksiyon giriş değişkenleri
    % V: n elemanlı bir vektör
    % h: (b-a)/n

    % Fonksiyon çıkış değeri
    % integral: vektörün kapladığı alanın yaklaşık değeri

    % Örnek giriş değişkenleri
    % V = [ 0.1 0.2 0.3 0.4 0.3 0.3 0.2 0.1 0.05];
    % h = 0.05;

    % Örnek çıkış değişkeni
    % integral = 0.0958

    % Vektörün uzunlugunu bulalım.
    n = length(V);

    % Eğer terim sayısı çiftse hata ver ve fonksiyondan çık
    if rem(n, 2) == 0 
        error('vektör terim sayısı tek olmalıdır.');
    end
    
    % yaklaşık integral değeri
    % (h/3) *  (ilk_terim + 4 * tekTerimlerinToplamı + 2 * ciftTerimlerinToplamı + son_terim)


    % İlk ve son terimler
    ilkTerim = V(1); %ilk terim
    sonTerim = V(end); %son terim
    
    % tek terimlerin katsayısı: Simpson kuralından gelen bir sabit
    tekKatsayi = 4;
    
    %çift terimlerin katsayısı: Simpson kuralından gelen bir sabit
    ciftKatsayi = 2;
    
    % % Tek katsayılı terimlerin toplamı
    tekToplam = 0; % başlangıçta sıfırlıyoruz
    % 
    % % Çift katsayılı terimlerin toplamı
    ciftToplam = 0;  % başlangıçta sıfırlıyoruz

    % %Tek indexli terimleri topla
    for i = 1:2:n
        tekToplam  = tekToplam  + V(i);
    end
    % 
    % Çift indeksli terimleri topla    
    for i = 2:2:n
        ciftToplam = ciftToplam + V(i);
    end
    
    % alan hesabı
    alan = (ilkTerim + (tekKatsayi * tekToplam) ...
        + (ciftKatsayi * ciftToplam) + sonTerim);
    
    % Son adımın hesaplanması
    integral = alan * (h / 3);
 
    % integral= (h/3)*(V(1)+V(end)+4*sum(V(2:2:n-1)) + 2*sum(V(3:2:n-2)))


 end
