import 'package:json_annotation/json_annotation.dart';

part 'account.g.dart';

@JsonSerializable()
class Account {
  String id;
  String name;
  String email;
  String password;
  String avatarUrl;

  Account(
      {required this.id,
      required this.name,
      required this.email,
      required this.password,
      required this.avatarUrl});

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  Map<String, dynamic> toJSON() => _$AccountToJson(this);
}
