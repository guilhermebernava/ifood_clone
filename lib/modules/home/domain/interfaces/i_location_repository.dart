import 'package:dartz/dartz.dart';
import 'package:ifood_clone/core/domain/entities/address.dart';
import 'package:ifood_clone/modules/home/domain/erros/location_execption.dart';
import 'package:ifood_clone/modules/home/infra/interfaces/i_location_datasource.dart';

abstract class ILocationRepository {
  final ILocationDatasource locationDatasource;
  ILocationRepository({required this.locationDatasource});

  Future<Either<LocationExecption, Address>> getCurrentLocation();
  Future<Either<LocationExecption, Address>> getLocationFromAddress(
      String location);
}
