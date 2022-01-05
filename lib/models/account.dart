import 'package:json_annotation/json_annotation.dart';
part 'account.g.dart';
@JsonSerializable()
class Account{
  late String email = '';
  late String password = '';

  Account(this.email, this.password);

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);

  Map<String, dynamic> toJSON() => _$AccountToJson(this);
}