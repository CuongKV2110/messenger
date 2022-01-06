// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoryResponse _$StoryResponseFromJson(Map<String, dynamic> json) =>
    StoryResponse(
      (json['data'] as List<dynamic>)
          .map((e) => Story.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['success'] as bool,
    );

Map<String, dynamic> _$StoryResponseToJson(StoryResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'success': instance.success,
    };
