import 'SubSymptom.dart';

class Symptoms {
  Symptoms({
      this.id, 
      this.title, 
      this.subSymptom,
    this.selectedSubSymptom,
  });

  Symptoms.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    if (json['sub_symptom'] != null) {
      subSymptom = [];
      json['sub_symptom'].forEach((v) {
        subSymptom.add(SubSymptom.fromJson(v));
      });
    }
  }
  int id;
  String title;
  List<SubSymptom> subSymptom;
  SubSymptom selectedSubSymptom;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    if (subSymptom != null) {
      map['sub_symptom'] = subSymptom.map((v) => v.toJson()).toList();
    }
    return map;
  }

}