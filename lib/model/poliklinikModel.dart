class PoliklinikModel {
  int? poliklinikID;
  String? poliklinikName;

  PoliklinikModel({this.poliklinikID, this.poliklinikName});

  PoliklinikModel.fromJson(Map<String, dynamic> json) {
    poliklinikID = json['poliklinikID'];
    poliklinikName = json['poliklinikName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['poliklinikID'] = this.poliklinikID;
    data['poliklinikName'] = this.poliklinikName;
    return data;
  }
}
