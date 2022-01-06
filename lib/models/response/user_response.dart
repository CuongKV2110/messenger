import 'package:json_annotation/json_annotation.dart';

import '../user.dart';
import 'api_response.dart';
part 'user_response.g.dart';

@JsonSerializable()
class UserResponse extends ApiResponse {
  final List<User> data;
  final bool success;

  UserResponse(this.data, this.success) : super(success: success);

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJSON() => _$UserResponseToJson(this);

}