import 'package:json_annotation/json_annotation.dart';
import 'package:messenger/models/account.dart';

import 'api_response.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse extends ApiResponse {
  Account data;
  final bool success;

  LoginResponse(this.data, this.success) : super(success: success);

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJSON() => _$LoginResponseToJson(this);

}