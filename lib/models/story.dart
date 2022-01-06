import 'package:json_annotation/json_annotation.dart';
part 'story.g.dart';
@JsonSerializable()
class Story{
    int id;
    String avt;
    String name;
    String fullname;
    String str;
    String music;
    String time;


    Story(this.id, this.avt, this.name, this.fullname, this.str, this.music,
      this.time);

    factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);

    Map<String, dynamic> toJSON() => _$StoryToJson(this);
}