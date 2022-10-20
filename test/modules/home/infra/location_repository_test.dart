import 'package:flutter_test/flutter_test.dart';
import 'package:ifood_clone/core/extensions/dartz_extension.dart';
import 'package:ifood_clone/modules/home/domain/erros/location_execption.dart';
import 'package:ifood_clone/modules/home/external/location_datasource.dart';
import 'package:ifood_clone/modules/home/infra/location_repository.dart';

void main() {
  final locationRepository = LocationRepository(LocationDatasource());

  test('It should not work because the bindings is not initialized', () async {
    final result = await locationRepository.getCurrentLocation();

    expect(result.isLeft(), true);
    expect(result.left(), isA<LocationExecption>());
  });
}
