import 'package:ifood_clone/core/domain/entities/address.dart';

abstract class LocationState {}

class LocationLoadingState implements LocationState {}

class LocationErrorState implements LocationState {}

class SucessState implements LocationState {
  final Address address;

  SucessState(this.address);
}
