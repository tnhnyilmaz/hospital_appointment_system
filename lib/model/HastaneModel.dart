class HastaneModel {
  int? hastaneID;
  String? hastaneAdi;
  String? hastaneIl;
  String? hastaneIlce;
  String? hastaneAdres;
  String? maps;
  Null? doktorlar;

  HastaneModel(
      {this.hastaneID,
      this.hastaneAdi,
      this.hastaneIl,
      this.hastaneIlce,
      this.hastaneAdres,
      this.maps,
      this.doktorlar});

  HastaneModel.fromJson(Map<String, dynamic> json) {
    hastaneID = json['hastaneID'];
    hastaneAdi = json['hastaneAdi'];
    hastaneIl = json['hastaneIl'];
    hastaneIlce = json['hastaneIlce'];
    hastaneAdres = json['hastaneAdres'];
    maps = json['maps'];
    doktorlar = json['doktorlar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hastaneID'] = this.hastaneID;
    data['hastaneAdi'] = this.hastaneAdi;
    data['hastaneIl'] = this.hastaneIl;
    data['hastaneIlce'] = this.hastaneIlce;
    data['hastaneAdres'] = this.hastaneAdres;
    data['maps'] = this.maps;
    data['doktorlar'] = this.doktorlar;
    return data;
  }
}
