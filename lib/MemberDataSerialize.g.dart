// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MemberDataSerialize.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberDataSerialize _$MemberDataSerializeFromJson(Map<String, dynamic> json) {
  return MemberDataSerialize(
      id: json['_id'] as String,
      name: json['name'] as String,
      city: json['city'] as String,
      age: json['age'] as String);
}

Map<String, dynamic> _$MemberDataSerializeToJson(
        MemberDataSerialize instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'city': instance.city,
      'age': instance.age
    };
