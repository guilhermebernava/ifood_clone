import 'package:dartz/dartz.dart';
import 'package:ifood_clone/core/domain/entities/address.dart';
import 'package:ifood_clone/modules/home/domain/erros/location_execption.dart';
import 'package:ifood_clone/modules/home/domain/interfaces/i_location_repository.dart';
import 'package:ifood_clone/modules/home/infra/interfaces/i_location_datasource.dart';

class LocationRepository implements ILocationRepository {
  @override
  final ILocationDatasource locationDatasource;

  LocationRepository(this.locationDatasource);

  @override
  Future<Either<LocationExecption, Address>> getCurrentLocation() async {
    try {
      final address = await locationDatasource.getCurrentLocation();

      if (address == null) {
        return Left(LocationExecption(message: 'Could not get your location'));
      }

      return Right(address);
    } catch (e) {
      return Left(LocationExecption(message: e.toString()));
    }
  }

  @override
  Future<Either<LocationExecption, Address>> getLocationFromAddress(
      String location) async {
    try {
      final address = await locationDatasource.getLocationFromAddress(location);

      if (address == null) {
        return Left(LocationExecption(message: 'Could not get your location'));
      }

      return Right(address);
    } catch (e) {
      return Left(LocationExecption(message: e.toString()));
    }
  }
}
