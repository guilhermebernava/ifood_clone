import 'package:ifood_clone/core/domain/entities/user.dart';

abstract class UserState {}

class LoggedState extends UserState {
  final User user;

  LoggedState(this.user);
}

class NotLoggedState extends UserState {}

class ErrorState extends UserState {
  final String message;

  ErrorState(this.message);
}

class LoadingState extends UserState {}
