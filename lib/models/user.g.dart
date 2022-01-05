// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['avt'] as String,
      json['name'] as String,
      json['chat'] as String,
      json['time'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'avt': instance.avt,
      'name': instance.name,
      'chat': instance.chat,
      'time': instance.time,
    };
