import 'package:ifood_clone/core/domain/entities/user.dart';

abstract class UserState {}

class Logged extends UserState {
  final User user;

  Logged(this.user);
}

class NotLogged extends UserState {}

class ErrorState extends UserState {
  final String message;

  ErrorState(this.message);
}

class Loading extends UserState {}
