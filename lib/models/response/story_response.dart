import 'package:json_annotation/json_annotation.dart';
import 'package:messenger/models/story.dart';
import 'api_response.dart';
part 'story_response.g.dart';

@JsonSerializable()
class StoryResponse extends ApiResponse {
  final List<Story> data;

  StoryResponse(this.data);

  factory StoryResponse.fromJson(Map<String, dynamic> json) =>
      _$StoryResponseFromJson(json);

  Map<String, dynamic> toJSON() => _$StoryResponseToJson(this);

}