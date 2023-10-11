class CityToPlaka {
  String findPlakaNo(String selectedCity) {
    List<Map<String, dynamic>> cityData = [
      {"plakaNo": 1, "ilAdi": "Adana"},
      {"plakaNo": 2, "ilAdi": "Adıyaman"},
      {"plakaNo": 3, "ilAdi": "Afyon"},
      {"plakaNo": 4, "ilAdi": "Ağrı"},
      {"plakaNo": 68, "ilAdi": "Aksaray"},
      {"plakaNo": 5, "ilAdi": "Amasya"},
      {"plakaNo": 6, "ilAdi": "Ankara"},
      {"plakaNo": 7, "ilAdi": "Antalya"},
      {"plakaNo": 75, "ilAdi": "Ardahan"},
      {"plakaNo": 8, "ilAdi": "Artvin"},
      {"plakaNo": 9, "ilAdi": "Aydın"},
      {"plakaNo": 10, "ilAdi": "Balıkesir"},
      {"plakaNo": 74, "ilAdi": "Bartın"},
      {"plakaNo": 72, "ilAdi": "Batman"},
      {"plakaNo": 69, "ilAdi": "Bayburt"},
      {"plakaNo": 11, "ilAdi": "Bilecik"},
      {"plakaNo": 12, "ilAdi": "Bingöl"},
      {"plakaNo": 13, "ilAdi": "Bitlis"},
      {"plakaNo": 14, "ilAdi": "Bolu"},
      {"plakaNo": 15, "ilAdi": "Burdur"},
      {"plakaNo": 16, "ilAdi": "Bursa"},
      {"plakaNo": 17, "ilAdi": "Çanakkale"},
      {"plakaNo": 18, "ilAdi": "Çankırı"},
      {"plakaNo": 19, "ilAdi": "Çorum"},
      {"plakaNo": 20, "ilAdi": "Denizli"},
      {"plakaNo": 21, "ilAdi": "Diyarbakır"},
      {"plakaNo": 81, "ilAdi": "Düzce"},
      {"plakaNo": 22, "ilAdi": "Edirne"},
      {"plakaNo": 23, "ilAdi": "Elazığ"},
      {"plakaNo": 24, "ilAdi": "Erzincan"},
      {"plakaNo": 25, "ilAdi": "Erzurum"},
      {"plakaNo": 26, "ilAdi": "Eskişehir"},
      {"plakaNo": 27, "ilAdi": "Gaziantep"},
      {"plakaNo": 28, "ilAdi": "Giresun"},
      {"plakaNo": 29, "ilAdi": "Gümüşhane"},
      {"plakaNo": 30, "ilAdi": "Hakkari"},
      {"plakaNo": 31, "ilAdi": "Hatay"},
      {"plakaNo": 76, "ilAdi": "Iğdır"},
      {"plakaNo": 32, "ilAdi": "Isparta"},
      {"plakaNo": 33, "ilAdi": "İçel"},
      {"plakaNo": 34, "ilAdi": "İstanbul"},
      {"plakaNo": 35, "ilAdi": "İzmir"},
      {"plakaNo": 46, "ilAdi": "Kahramanmaraş"},
      {"plakaNo": 78, "ilAdi": "Karabük"},
      {"plakaNo": 70, "ilAdi": "Karaman"},
      {"plakaNo": 36, "ilAdi": "Kars"},
      {"plakaNo": 37, "ilAdi": "Kastamonu"},
      {"plakaNo": 38, "ilAdi": "Kayseri"},
      {"plakaNo": 71, "ilAdi": "Kırkkale"},
      {"plakaNo": 39, "ilAdi": "Kırklareli"},
      {"plakaNo": 40, "ilAdi": "Kırşehir"},
      {"plakaNo": 79, "ilAdi": "Kilis"},
      {"plakaNo": 41, "ilAdi": "Kocaeli"},
      {"plakaNo": 42, "ilAdi": "Konya"},
      {"plakaNo": 43, "ilAdi": "Kütahya"},
      {"plakaNo": 44, "ilAdi": "Malatya"},
      {"plakaNo": 45, "ilAdi": "Manisa"},
      {"plakaNo": 47, "ilAdi": "Mardin"},
      {"plakaNo": 48, "ilAdi": "Muğla"},
      {"plakaNo": 49, "ilAdi": "Muş"},
      {"plakaNo": 50, "ilAdi": "Nevşehir"},
      {"plakaNo": 51, "ilAdi": "Niğde"},
      {"plakaNo": 52, "ilAdi": "Ordu"},
      {"plakaNo": 80, "ilAdi": "Osmaniye"},
      {"plakaNo": 53, "ilAdi": "Rize"},
      {"plakaNo": 54, "ilAdi": "Sakarya"},
      {"plakaNo": 55, "ilAdi": "Samsun"},
      {"plakaNo": 56, "ilAdi": "Siirt"},
      {"plakaNo": 57, "ilAdi": "Sinop"},
      {"plakaNo": 58, "ilAdi": "Sivas"},
      {"plakaNo": 63, "ilAdi": "Şanlıurfa"},
      {"plakaNo": 73, "ilAdi": "Şırnak"},
      {"plakaNo": 59, "ilAdi": "Tekirdağ"},
      {"plakaNo": 60, "ilAdi": "Tokat"},
      {"plakaNo": 61, "ilAdi": "Trabzon"},
      {"plakaNo": 62, "ilAdi": "Tunceli"},
      {"plakaNo": 64, "ilAdi": "Uşak"},
      {"plakaNo": 65, "ilAdi": "Van"},
      {"plakaNo": 77, "ilAdi": "Yalova"},
      {"plakaNo": 66, "ilAdi": "Yozgat"},
      {"plakaNo": 67, "ilAdi": "Zonguldak"}
    ];
    for (var cityData in cityData) {
      if (cityData["ilAdi"] == selectedCity) {
        return cityData["plakaNo"].toString();
      }
    }
    return "0";
  }
}