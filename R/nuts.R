#' Statistical region levels of Turkey
#'
#' @source http://ec.europa.eu/eurostat/en/web/products-manuals-and-guidelines/-/KS-RA-07-023
#'
#' @export
nuts_level <- tibble::frame_data(
  ~level_1           ,  ~level_2   ,  ~city           ,
  "İstanbul         ",	"İstanbul ",	"İstanbul      ",
  "Batı Marmara     ",	"Tekirdağ ",	"Tekirdağ      ",
  "Batı Marmara     ",	"Tekirdağ ",	"Edirne        ",
  "Batı Marmara     ",	"Tekirdağ ",	"Kırklareli    ",
  "Batı Marmara     ",	"Balıkesir",	"Balıkesir     ",
  "Batı Marmara     ",	"Balıkesir",	"Çanakkale     ",
  "Ege              ",	"İzmir    ",	"İzmir         ",
  "Ege              ",	"Aydın    ",	"Aydın         ",
  "Ege              ",	"Aydın    ",	"Denizli       ",
  "Ege              ",	"Aydın    ",	"Muğla         ",
  "Ege              ",	"Manisa   ",	"Manisa        ",
  "Ege              ",	"Manisa   ",	"Afyonkarahisar",
  "Ege              ",	"Manisa   ",	"Kütahya       ",
  "Ege              ",	"Manisa   ",	"Uşak          ",
  "Doğu Marmara     ",	"Bursa    ",	"Bursa         ",
  "Doğu Marmara     ",	"Bursa    ",	"Eskişehir     ",
  "Doğu Marmara     ",	"Bursa    ",	"Bilecik       ",
  "Doğu Marmara     ",	"Kocaeli  ",	"Kocaeli       ",
  "Doğu Marmara     ",	"Kocaeli  ",	"Sakarya       ",
  "Doğu Marmara     ",	"Kocaeli  ",	"Düzce         ",
  "Doğu Marmara     ",	"Kocaeli  ",	"Bolu          ",
  "Doğu Marmara     ",	"Kocaeli  ",	"Yalova        ",
  "Batı Anadolu     ",	"Ankara   ",	"Ankara        ",
  "Batı Anadolu     ",	"Konya    ",	"Konya         ",
  "Batı Anadolu     ",	"Konya    ",	"Karaman       ",
  "Akdeniz          ",	"Antalya  ",	"Antalya       ",
  "Akdeniz          ",	"Antalya  ",	"Isparta       ",
  "Akdeniz          ",	"Antalya  ",	"Burdur        ",
  "Akdeniz          ",	"Adana    ",	"Adana         ",
  "Akdeniz          ",	"Adana    ",	"Mersin        ",
  "Akdeniz          ",	"Hatay    ",	"Hatay         ",
  "Akdeniz          ",	"Hatay    ",	"Kahramanmaraş ",
  "Akdeniz          ",	"Hatay    ",	"Osmaniye      ",
  "Orta Anadolu     ",	"Kırıkkale",	"Kırıkkale     ",
  "Orta Anadolu     ",	"Kırıkkale",	"Aksaray       ",
  "Orta Anadolu     ",	"Kırıkkale",	"Niğde         ",
  "Orta Anadolu     ",	"Kırıkkale",	"Nevşehir      ",
  "Orta Anadolu     ",	"Kırıkkale",	"Kırşehir      ",
  "Orta Anadolu     ",	"Kayseri  ",	"Kayseri       ",
  "Orta Anadolu     ",	"Kayseri  ",	"Sivas         ",
  "Orta Anadolu     ",	"Kayseri  ",	"Yozgat        ",
  "Batı Karadeniz   ",	"Zonguldak",	"Zonguldak     ",
  "Batı Karadeniz   ",	"Zonguldak",	"Karabük       ",
  "Batı Karadeniz   ",	"Zonguldak",	"Bartın        ",
  "Batı Karadeniz   ",	"Kastamonu",	"Kastamonu     ",
  "Batı Karadeniz   ",	"Kastamonu",	"Çankırı       ",
  "Batı Karadeniz   ",	"Kastamonu",	"Sinop         ",
  "Batı Karadeniz   ",	"Samsun   ",	"Samsun        ",
  "Batı Karadeniz   ",	"Samsun   ",	"Tokat         ",
  "Batı Karadeniz   ",	"Samsun   ",	"Çorum         ",
  "Batı Karadeniz   ",	"Samsun   ",	"Amasya        ",
  "Doğu Karadeniz   ",	"Trabzon  ",	"Trabzon       ",
  "Doğu Karadeniz   ",	"Trabzon  ",	"Ordu          ",
  "Doğu Karadeniz   ",	"Trabzon  ",	"Giresun       ",
  "Doğu Karadeniz   ",	"Trabzon  ",	"Rize          ",
  "Doğu Karadeniz   ",	"Trabzon  ",	"Artvin        ",
  "Doğu Karadeniz   ",	"Trabzon  ",	"Gümüşhane     ",
  "Kuzeydoğu Anadolu",	"Erzurum  ",	"Erzurum       ",
  "Kuzeydoğu Anadolu",	"Erzurum  ",	"Erzincan      ",
  "Kuzeydoğu Anadolu",	"Erzurum  ",	"Bayburt       ",
  "Kuzeydoğu Anadolu",	"Ağrı     ",	"Ağrı          ",
  "Kuzeydoğu Anadolu",	"Ağrı     ",	"Kars          ",
  "Kuzeydoğu Anadolu",	"Ağrı     ",	"Iğdır         ",
  "Kuzeydoğu Anadolu",	"Ağrı     ",	"Ardahan       ",
  "Ortadoğu Anadolu ",	"Malatya  ",	"Malatya       ",
  "Ortadoğu Anadolu ",	"Malatya  ",	"Elazığ        ",
  "Ortadoğu Anadolu ",	"Malatya  ",	"Bingöl        ",
  "Ortadoğu Anadolu ",	"Malatya  ",	"Tunceli       ",
  "Ortadoğu Anadolu ",	"Van      ",	"Van           ",
  "Ortadoğu Anadolu ",	"Van      ",	"Muş           ",
  "Ortadoğu Anadolu ",	"Van      ",	"Bitlis        ",
  "Ortadoğu Anadolu ",	"Van      ",	"Hakkari       ",
  "Güneydoğu Anadolu",	"Gaziantep",	"Gaziantep     ",
  "Güneydoğu Anadolu",	"Gaziantep",	"Adıyaman      ",
  "Güneydoğu Anadolu",	"Gaziantep",	"Kilis         ",
  "Güneydoğu Anadolu",	"Şanlıurfa",	"Şanlıurfa     ",
  "Güneydoğu Anadolu",	"Şanlıurfa",	"Diyarbakır    ",
  "Güneydoğu Anadolu",	"Mardin   ",	"Mardin        ",
  "Güneydoğu Anadolu",	"Mardin   ",	"Batman        ",
  "Güneydoğu Anadolu",	"Mardin   ",	"Şırnak        ",
  "Güneydoğu Anadolu",	"Mardin   ",	"Siirt         "
  ) %>%
  dplyr::mutate_all(dplyr::funs(trimws(.))) %>% # trim white space
  arutil::make_frame_utf8()
