import 'package:flutter/cupertino.dart';

@immutable
abstract class AppEvent {}

class GetUser extends AppEvent {}

class GetStory extends AppEvent {}

class ChatView extends AppEvent {}

class FriendView extends AppEvent {}

class StoryView extends AppEvent {}

class InfoView extends AppEvent {}
