// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Story _$StoryFromJson(Map<String, dynamic> json) => Story(
      json['id'] as int,
      json['avt'] as String,
      json['name'] as String,
      json['fullname'] as String,
      json['str'] as String,
      json['music'] as String,
      json['time'] as String,
    );

Map<String, dynamic> _$StoryToJson(Story instance) => <String, dynamic>{
      'id': instance.id,
      'avt': instance.avt,
      'name': instance.name,
      'str': instance.str,
      'music': instance.music,
    };
