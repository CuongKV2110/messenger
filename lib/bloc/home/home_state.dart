import 'package:flutter/cupertino.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeProcessing extends HomeState {}

class HomeSuccess extends HomeState {}

class HomeError extends HomeState {}


