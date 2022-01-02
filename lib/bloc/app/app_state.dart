import 'package:flutter/cupertino.dart';

@immutable
abstract class AppState {}

class MessInitial extends AppState {}

class MessProcessing extends AppState {}

class MessSuccess extends AppState {}

class MessError extends AppState {}
