// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Report _$ReportFromJson(Map<String, dynamic> json) {
  return Report()
    ..date = json['date'] as String
    ..judul = json['judul'] as String
    ..detail = json['detail'] as String
    ..foto = json['foto'] as String;
}

Map<String, dynamic> _$ReportToJson(Report instance) => <String, dynamic>{
      'date': instance.date,
      'judul': instance.judul,
      'detail': instance.detail,
      'foto': instance.foto
    };
