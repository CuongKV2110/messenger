import 'package:flutter/material.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginProcessing extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginError extends LoginState {}
