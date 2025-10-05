# 🏠 Moto – Ev Hizmetleri Uygulaması UI Kiti (Flutter)

**Moto**, modern **Material 3** tasarım anlayışıyla geliştirilmiş profesyonel bir **Flutter UI kiti**dir.  
Ev hizmetleri, bakım, temizlik veya tamir hizmetleri sunan uygulamalar için oluşturulmuştur (örnek: آچاره benzeri platformlar).  

Hazır ekranları, modüler yapısı, güçlü navigasyon sistemi ve yeniden kullanılabilir bileşenleriyle;  
hem **hızlı prototipleme** hem de **üretim seviyesinde proje temeli** için kullanılabilir.

---

## ✨ Özellikler

- 🔹 **Material 3** tabanlı modern, temiz ve duyarlı tasarım  
- 🔹 Hizmet, yorum ve kategori için **demo verili tip tanımlı modeller**  
- 🔹 `go_router` ile çok yönlü ve güvenli **navigasyon yapısı**  
- 🔹 Görseller için **ImageHelper** sınıfı (hata toleranslı, web/desktop uyumlu)  
- 🔹 Modüler klasör yapısı ve **yeniden kullanılabilir widget bileşenleri**  

---

## 🧰 Teknoloji Yığını

| Katman | Teknoloji / Paket |
|:--|:--|
| **Framework** | Flutter SDK 3.9+ |
| **Navigasyon** | `go_router` |
| **UI** | Material 3, `AppTheme`, `AppTextStyles`, `AppColors` |
| **Görseller** | `ImageHelper` (güvenli ağ yükleyici) |
| **Puanlama** | `flutter_rating_bar` |
| **Durum Yönetimi** | Basit local state + demo data (Provider desteği hazır) |

---

## 🗺️ Navigasyon Yapısı

### 🔸 Alt Sekmeli Ana Kabuk (`MainScreen`)
- `/` → Ana Sayfa  
- `/bookings` → Rezervasyonlar  
- `/profile` → Profil  

### 🔸 Üst Seviye Rotalar
- `/categories/:categoryId` → Hizmet Kategorisi  
- `/services/:serviceId` → Hizmet Detayları  
- `/services/:serviceId/reviews` → Hizmet Yorumları  
- `/providers/:providerId` → Hizmet Sağlayıcısı  
- `/booking/:serviceId` → Rezervasyon Akışı  
- `/booking-success` → Başarılı Rezervasyon  
- `/notifications` → Bildirimler  
- `/settings` → Ayarlar  
- `/addresses` → Adres Yönetimi  
- `/login`, `/register` → Giriş / Kayıt (örnek sayfalar)

Tüm rotalar:  
📁 `lib/core/router/app_router.dart`

---

## 🧱 Proje Yapısı

```bash
lib/
 ├─ core/
 │   ├─ models/           # Hizmet, Yorum, Kategori modelleri (demo veriler dahil)
 │   ├─ router/           # go_router yapılandırması
 │   ├─ theme/            # Renkler, yazı tipleri, genel tema
 │   ├─ utils/            # Yardımcı fonksiyonlar (ImageHelper vs.)
 │   └─ widgets/          # Ortak bileşenler (buton, input, kart vb.)
 │
 ├─ features/
 │   ├─ home/             # Ana sayfa, öne çıkan & popüler hizmetler
 │   ├─ service_category/ # Kategoriler, filtreleme, sıralama
 │   ├─ service_details/  # Hizmet detayları, carousel, yorum önizleme
 │   ├─ service_reviews/  # Yorum ekranı, filtreleme sekmeleri
 │   ├─ service_provider/ # Sağlayıcı profili, istatistik, hizmet listesi
 │   ├─ booking/          # Rezervasyon ekranları ve başarı sayfası
 │   ├─ notifications/    # Bildirim listesi
 │   ├─ profile/          # Profil sayfası, adres ve ayar bağlantıları
 │   ├─ settings/         # Uygulama ayarları (gece modu, bildirim vb.)
 │   └─ address/          # Adres yönetimi
