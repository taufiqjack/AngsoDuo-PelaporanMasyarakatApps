import 'package:json_annotation/json_annotation.dart';

part 'report.g.dart';

@JsonSerializable()
class Report {
    Report();

    String date;
    String judul;
    String detail;
    String foto;
    
    factory Report.fromJson(Map<String,dynamic> json) => _$ReportFromJson(json);
    Map<String, dynamic> toJson() => _$ReportToJson(this);
}
