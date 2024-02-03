import 'package:json_annotation/json_annotation.dart';

part 'coach.g.dart';

@JsonSerializable()
class Coach {
  const Coach({this.id, this.fio, this.email, this.phone, this.description});

  factory Coach.fromJson(Map<String, dynamic> json) => _$CoachFromJson(json);

  final String? id;
  final String? fio;
  final String? email;
  final String? phone;
  final String? description;

  Map<String, dynamic> toJson() => _$CoachToJson(this);
}