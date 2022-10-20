import 'package:ifood_clone/core/domain/entities/address.dart';

abstract class LocationState {}

class LocationLoadingState implements LocationState {}

class LocationErrorState implements LocationState {}

class LocationSucessState implements LocationState {
  final Address address;

  LocationSucessState(this.address);
}
