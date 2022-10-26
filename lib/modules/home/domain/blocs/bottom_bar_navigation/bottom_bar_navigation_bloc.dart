import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ifood_clone/modules/home/domain/blocs/bottom_bar_navigation/bottom_bar_navigation_event.dart';
import 'package:ifood_clone/modules/home/domain/blocs/bottom_bar_navigation/bottom_bar_navigation_states.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  int index;
  NavigationBloc(this.index)
      : super(
          NavigationSuccess(index),
        ) {
    on<ChangeScreen>((event, emit) {
      if (event.index < 0) {
        emit(NavigationError());
        return;
      }

      emit(NavigationSuccess(index = event.index));
    });
  }
}
