class RandevuModel {
  int? randevuID;
  String? randevuTur;
  bool? randevuState;
  String? randevuPoliklinik;
  String? randevuPoliklinikYer;
  String? randevuKullanici;
  String? randevuHastane;
  String? randevuDate;
  String? randevuTime;

  RandevuModel(
      {this.randevuID,
      this.randevuTur,
      this.randevuState,
      this.randevuPoliklinik,
      this.randevuPoliklinikYer,
      this.randevuKullanici,
      this.randevuHastane,
      this.randevuDate,
      this.randevuTime});

  RandevuModel.fromJson(Map<String, dynamic> json) {
    randevuID = json['randevuID'];
    randevuTur = json['randevuTur'];
    randevuState = json['randevuState'];
    randevuPoliklinik = json['randevuPoliklinik'];
    randevuPoliklinikYer = json['randevuPoliklinikYer'];
    randevuKullanici = json['randevuKullanici'];
    randevuHastane = json['randevuHastane'];
    randevuDate = json['randevuDate'];
    randevuTime = json['randevuTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['randevuID'] = this.randevuID;
    data['randevuTur'] = this.randevuTur;
    data['randevuState'] = this.randevuState;
    data['randevuPoliklinik'] = this.randevuPoliklinik;
    data['randevuPoliklinikYer'] = this.randevuPoliklinikYer;
    data['randevuKullanici'] = this.randevuKullanici;
    data['randevuHastane'] = this.randevuHastane;
    data['randevuDate'] = this.randevuDate;
    data['randevuTime'] = this.randevuTime;
    return data;
  }
}
