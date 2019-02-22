import 'package:json_annotation/json_annotation.dart';

part 'MemberDataSerialize.g.dart';

@JsonSerializable(nullable: false)
class MemberDataSerialize {
  @JsonKey(name: '_id')
  String id;
  String name;
  String city;
  String age;

  MemberDataSerialize({this.id, this.name, this.city, this.age});

  factory MemberDataSerialize.fromJson(Map<String, dynamic> json) =>
      _$MemberDataSerializeFromJson(json);
}
