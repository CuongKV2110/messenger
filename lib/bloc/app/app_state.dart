import 'package:meta/meta.dart';

@immutable
abstract class AppState {}

class Initial extends AppState {}

class NotAuthenticated extends AppState {}

class Authenticated extends AppState {}

class Loading extends AppState {}