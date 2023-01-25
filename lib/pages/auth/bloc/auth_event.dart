part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthStarted extends AuthEvent{}

class AuthButtonIsClicked extends AuthEvent{
  final String username;
  final String password;
  AuthButtonIsClicked(this.username, this.password);
}

class AuthModeChangeIsClicked extends AuthEvent{}