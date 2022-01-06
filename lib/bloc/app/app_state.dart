import 'package:flutter/cupertino.dart';

@immutable
abstract class AppState {}

class HomeInitial extends AppState {}

class HomeProcessing extends AppState {}

class HomeSuccess extends AppState {}

class HomeError extends AppState {}


