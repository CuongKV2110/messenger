import 'package:flutter/cupertino.dart';

@immutable
abstract class SettingEvent {}

class LoadSetting extends SettingEvent {}

class UpdateSetting extends SettingEvent {
  final String locale;

  UpdateSetting({required this.locale});
}

class StoreSetting extends SettingEvent {}
