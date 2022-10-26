import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ifood_clone/modules/home/domain/blocs/bottom_bar_navigation/bottom_bar_navigation_event.dart';
import 'package:ifood_clone/modules/home/domain/blocs/bottom_bar_navigation/bottom_bar_navigation_states.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  int index;
  NavigationBloc(this.index)
      : super(
          NavigationSuccess(index),
        ) {
    Modular.to.navigate('./home');
    on<ChangeScreen>((event, emit) {
      if (event.index < 0) {
        emit(NavigationError());
        return;
      }

      switch (event.index) {
        case 0:
          Modular.to.navigate('./home');
          break;
        case 1:
          Modular.to.navigate("./restaurant");
          break;
      }

      emit(NavigationSuccess(index = event.index));
    });
  }
}
