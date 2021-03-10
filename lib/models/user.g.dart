// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..uid = json['uid'] as String
    ..nik = json['nik'] as String
    ..noTelp = json['noTelp'] as String
    ..name = json['name'] as String
    ..email = json['email'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'uid': instance.uid,
      'nik': instance.nik,
      'noTelp': instance.noTelp,
      'name': instance.name,
      'email': instance.email
    };
