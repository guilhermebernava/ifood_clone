import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ifood_clone/modules/home/domain/blocs/bottom_bar_navigation/bottom_bar_navigation_bloc.dart';
import 'package:ifood_clone/modules/home/domain/blocs/bottom_bar_navigation/bottom_bar_navigation_event.dart';
import 'package:ifood_clone/modules/home/domain/blocs/bottom_bar_navigation/bottom_bar_navigation_states.dart';

void main() {
  blocTest<NavigationBloc, NavigationState>(
    'emits [NavigationError] when have an error with ChangeScreen event',
    build: () => NavigationBloc(0),
    act: (bloc) => bloc.add(ChangeScreen(-1)),
    expect: () => [isA<NavigationError>()],
  );

  blocTest<NavigationBloc, NavigationState>(
    'emits [NavigationSuccess] when have a Success with ChangeScreen event',
    build: () => NavigationBloc(0),
    act: (bloc) => bloc.add(ChangeScreen(1)),
    expect: () => [isA<NavigationSuccess>()],
  );
}
