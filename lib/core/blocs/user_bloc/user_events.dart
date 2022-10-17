import 'package:ifood_clone/core/domain/entities/login.dart';

abstract class UserEvent {}

class LogoutEvent extends UserEvent {}

class LoginEvent extends UserEvent {
  final Login login;

  LoginEvent(this.login);
}
