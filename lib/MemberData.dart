class MemberData {
  final String name;

  const MemberData({
    this.name,
  });

  factory MemberData.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      throw FormatException("Null JSON provided to MemberData");
    }

//    return new MemberData(
//      name: json['name'] ?? "",
//      _id: json['_id'] ?? "",
//      city: json['city'] ?? "",
//      age: age['streets'],
//    );

    return MemberData(name: json['name'] ?? "");
  }
}
