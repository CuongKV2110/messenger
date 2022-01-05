import 'package:flutter/cupertino.dart';

@immutable
abstract class AppEvent {}

class ChatView extends AppEvent {}

class FriendView extends AppEvent {}

class FriendSearch extends AppEvent {}

class StoryView extends AppEvent {}

class InfoView extends AppEvent {}
