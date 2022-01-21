import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'story.g.dart';
@JsonSerializable()
class Story{
    int id;
    String status;
    String avt;
    String name;
    String fullname;
    int friend;
    String str;
    String music;
    int time;


    Story(this.id, this.status, this.avt, this.name, this.fullname,this.friend, this.str,
      this.music, this.time);

    factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);

    Map<String, dynamic> toJSON() => _$StoryToJson(this);
}