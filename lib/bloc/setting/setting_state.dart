import 'package:flutter/cupertino.dart';

@immutable
abstract class SettingState {}

class SettingInitial extends SettingState {}

class SettingLoaded extends SettingState {}

class SettingUpdated extends SettingState {}

class SettingStored extends SettingState {}