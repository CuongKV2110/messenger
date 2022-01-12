// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      (json['data'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..success = json['success'] as bool
      ..errorCode = json['errorCode'] as String
      ..errorMessage = json['errorMessage'] as String;

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'errorCode': instance.errorCode,
      'errorMessage': instance.errorMessage,
      'data': instance.data,
    };
