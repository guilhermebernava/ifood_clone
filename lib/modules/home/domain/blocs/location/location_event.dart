import 'package:ifood_clone/modules/home/domain/entities/search_address.dart';

abstract class LocationEvent {}

class GetLocation implements LocationEvent {}

class GetLocationFromAddress implements LocationEvent {
  final SearchAddress searchAddress;

  GetLocationFromAddress(this.searchAddress);
}
