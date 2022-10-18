import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ifood_clone/core/blocs/user_bloc/user_bloc.dart';
import 'package:ifood_clone/core/blocs/user_bloc/user_events.dart';
import 'package:ifood_clone/core/blocs/user_bloc/user_states.dart';
import 'package:ifood_clone/core/domain/entities/login.dart';

void main() {
  blocTest<UserBloc, UserState>(
    'emits [LoadingState, LoggedState] when LoginEvent is send to UserBloc',
    build: () => UserBloc(),
    act: (bloc) => bloc.add(LoginEvent(Login(email: 'g', password: '123'))),
    wait: const Duration(seconds: 2),
    expect: () => [isA<LoadingState>(), isA<LoggedState>()],
  );

  blocTest<UserBloc, UserState>(
    'emits [NotLoggedState] when LogoutEvent is send to UserBloc',
    build: () => UserBloc(),
    act: (bloc) => bloc.add(LogoutEvent()),
    expect: () => [isA<NotLoggedState>()],
  );
}
