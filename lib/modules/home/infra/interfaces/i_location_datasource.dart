import 'package:ifood_clone/core/domain/entities/address.dart';

abstract class ILocationDatasource {
  Future<Address?> getCurrentLocation();
  Future<Address?> getLocationFromAddress(String address);
}
