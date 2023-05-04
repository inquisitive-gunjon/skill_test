class SubSymptom {
  SubSymptom({
      this.id, 
      this.icon, 
      this.title,});

  SubSymptom.fromJson(dynamic json) {
    id = json['id'];
    icon = json['icon'];
    title = json['title'];
  }
  int id;
  String icon;
  String title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['icon'] = icon;
    map['title'] = title;
    return map;
  }

}