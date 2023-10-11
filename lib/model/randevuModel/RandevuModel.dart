class RandevuModel {
  final int randevuID;
  final String randevuTur;
  final bool randevuState;
  final String randevuPoliklinik;
  final String randevuPoliklinikYer;
  final String randevuKullanici;
  final String randevuHastane;

  RandevuModel({
    required this.randevuID,
    required this.randevuTur,
    required this.randevuState,
    required this.randevuPoliklinik,
    required this.randevuPoliklinikYer,
    required this.randevuKullanici,
    required this.randevuHastane,
  });

  factory RandevuModel.fromJson(Map<String, dynamic> json) {
    return RandevuModel(
      randevuID: json['randevuID'],
      randevuTur: json['randevuTur'],
      randevuState: json['randevuState'],
      randevuPoliklinik: json['randevuPoliklinik'],
      randevuPoliklinikYer: json['randevuPoliklinikYer'],
      randevuKullanici: json['randevuKullanici'],
      randevuHastane: json['randevuHastane'],
    );
  }
}
