// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      Account.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..success = json['success'] as bool
      ..errorCode = json['errorCode'] as String
      ..errorMessage = json['errorMessage'] as String;

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'errorCode': instance.errorCode,
      'errorMessage': instance.errorMessage,
      'data': instance.data,
    };
