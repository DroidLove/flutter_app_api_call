class MemberData {
  final String id;
  final String name;
  final String city;
  final String age;

  const MemberData({this.id, this.name, this.age, this.city});

  factory MemberData.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      throw FormatException("Null JSON provided to MemberData");
    }

    return MemberData(
        id: json['_id'] ?? "",
        name: json['name'] ?? "",
        city: json['city'] ?? "",
        age: json['age'] ?? "");
  }
}
