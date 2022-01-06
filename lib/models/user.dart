import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';
@JsonSerializable()

class User{
  late int id;
  late String avt;
  late String name;
  late String chat;
  late String time;


  User(this.id, this.avt, this.name, this.chat, this.time);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJSON() => _$UserToJson(this);
}