abstract class NavigationState {}

class NavigationSuccess implements NavigationState {
  final int index;
  NavigationSuccess(this.index);
}

class NavigationError implements NavigationState {}
