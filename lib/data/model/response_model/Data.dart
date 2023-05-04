import 'Symptoms.dart';

class Data {
  Data({
      this.symptoms,});

  Data.fromJson(dynamic json) {
    if (json['symptoms'] != null) {
      symptoms = [];
      json['symptoms'].forEach((v) {
        symptoms.add(Symptoms.fromJson(v));
      });
    }
  }
  List<Symptoms> symptoms;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (symptoms != null) {
      map['symptoms'] = symptoms.map((v) => v.toJson()).toList();
    }
    return map;
  }

}