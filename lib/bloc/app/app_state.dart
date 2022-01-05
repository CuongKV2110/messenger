import 'package:flutter/cupertino.dart';

@immutable
abstract class AppState {}

class MessInitial extends AppState {}

class MessProcessing extends AppState {}

class MessSuccess extends AppState {}

class MessError extends AppState {}

class InfoSuccess extends AppState {}

class StorySuccess extends AppState {}

class FriendSuccess extends AppState {}
