// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Story _$StoryFromJson(Map<String, dynamic> json) => Story(
      json['id'] as int,
      json['status'] as String,
      json['avt'] as String,
      json['name'] as String,
      json['fullname'] as String,
      json['str'] as String,
      json['music'] as String,
      json['time'] as int,
    );

Map<String, dynamic> _$StoryToJson(Story instance) => <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'avt': instance.avt,
      'name': instance.name,
      'fullname': instance.fullname,
      'str': instance.str,
      'music': instance.music,
      'time': instance.time,
    };
