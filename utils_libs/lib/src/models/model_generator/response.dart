import 'package:json_annotation/json_annotation.dart';
part 'response.g.dart';
@JsonSerializable()
class ResponseStatus {
  int status;
  String message;
  ResponseStatus({this.status, this.message});
  factory ResponseStatus.fromJson(Map<String, dynamic> json) => _$ResponseStatusFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseStatusToJson(this);
}