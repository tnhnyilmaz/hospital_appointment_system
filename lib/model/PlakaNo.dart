class PlakaNo {
  int? plakaNo;
  String? ilAdi;

  PlakaNo({this.plakaNo, this.ilAdi});

  PlakaNo.fromJson(Map<String, dynamic> json) {
    plakaNo = json['plakaNo'];
    ilAdi = json['ilAdi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plakaNo'] = this.plakaNo;
    data['ilAdi'] = this.ilAdi;
    return data;
  }
}
