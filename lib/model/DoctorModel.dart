class DoctorModel {
  int? doktorID;
  String? doktorAdi;
  String? doktorSoyadi;
  String? doktorUnvan;
  String? hastaneID;
  String? doktorUzmanlik;

  DoctorModel(
      {this.doktorID,
      this.doktorAdi,
      this.doktorSoyadi,
      this.doktorUnvan,
      this.hastaneID,
      this.doktorUzmanlik});

  DoctorModel.fromJson(Map<String, dynamic> json) {
    doktorID = json['doktorID'];
    doktorAdi = json['doktorAdi'];
    doktorSoyadi = json['doktorSoyadi'];
    doktorUnvan = json['doktorUnvan'];
    hastaneID = json['hastaneID'];
    doktorUzmanlik = json['doktorUzmanlik'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doktorID'] = this.doktorID;
    data['doktorAdi'] = this.doktorAdi;
    data['doktorSoyadi'] = this.doktorSoyadi;
    data['doktorUnvan'] = this.doktorUnvan;
    data['hastaneID'] = this.hastaneID;
    data['doktorUzmanlik'] = this.doktorUzmanlik;
    return data;
  }
}
