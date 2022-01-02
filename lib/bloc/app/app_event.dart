import 'package:flutter/cupertino.dart';

@immutable
abstract class AppEvent {}

class ChatViews extends AppEvent {}

class FriendViews extends AppEvent {}

class FriendSearch extends AppEvent {}

class StoryViews extends AppEvent {}

class InfoView extends AppEvent {}
