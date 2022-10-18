import 'package:geocode/geocode.dart' as geocode;
import 'package:ifood_clone/core/domain/entities/address.dart';
import 'package:ifood_clone/modules/home/infra/interfaces/i_location_datasource.dart';
import 'package:location/location.dart';

class LocationDatasource implements ILocationDatasource {
  @override
  Future<Address?> getCurrentLocation() async {
    final location = Location();
    final result = await _validateAccessToLocation(location);

    if (!result) {
      return null;
    }

    final locationData = await location.getLocation();
    final geoCode = geocode.GeoCode();
    final data = await geoCode.reverseGeocoding(
      latitude: locationData.latitude!,
      longitude: locationData.longitude!,
    );

    return Address(
      street: '${data.streetAddress}, ${data.streetNumber}',
      zipCode: data.postal ?? '',
    );
  }

  @override
  Future<Address?> getLocationFromAddress(String address) {
    //TODO implementar essa feature
    throw UnimplementedError();
  }

  Future<bool> _validateAccessToLocation(Location location) async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return false;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return false;
      }
    }

    return true;
  }
}
