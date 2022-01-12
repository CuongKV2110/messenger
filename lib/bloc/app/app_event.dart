import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AppEvent {}

class TryAuthenticating extends AppEvent {}

class Logout extends AppEvent {}