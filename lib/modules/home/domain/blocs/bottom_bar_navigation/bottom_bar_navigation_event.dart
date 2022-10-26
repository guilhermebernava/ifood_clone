abstract class NavigationEvent {}

class ChangeScreen implements NavigationEvent {
  final int index;

  ChangeScreen(this.index);
}
