import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ifood_clone/core/domain/entities/address.dart';
import 'package:ifood_clone/core/domain/value_objects/not_null_string.dart';
import 'package:ifood_clone/modules/home/domain/blocs/location/location_bloc.dart';
import 'package:ifood_clone/modules/home/domain/blocs/location/location_event.dart';
import 'package:ifood_clone/modules/home/domain/blocs/location/location_states.dart';
import 'package:ifood_clone/modules/home/domain/entities/search_address.dart';
import 'package:ifood_clone/modules/home/domain/erros/location_execption.dart';
import 'package:ifood_clone/modules/home/domain/interfaces/i_location_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockRepository extends Mock implements ILocationRepository {}

void main() {
  final mockRepository = MockRepository();
  final errorMockRepository = MockRepository();

  setUp(() {
    when(() => mockRepository.getCurrentLocation()).thenAnswer(
      (invocation) async => Right(
        Address(street: 'teste', zipCode: ''),
      ),
    );

    when(() => mockRepository.getLocationFromAddress('')).thenAnswer(
      (invocation) async => Right(
        Address(street: 'teste', zipCode: ''),
      ),
    );

    when(() => errorMockRepository.getCurrentLocation()).thenAnswer(
      (invocation) async => Left(
        LocationExecption(message: 'Error'),
      ),
    );

    when(() => errorMockRepository.getLocationFromAddress('')).thenAnswer(
      (invocation) async => Left(
        LocationExecption(message: 'Error'),
      ),
    );
  });

  blocTest<LocationBloc, LocationState>(
    'emits [LocationLoadingState, LocationSucessState] when have a success with GetLocation event',
    build: () => LocationBloc(mockRepository),
    act: (bloc) => bloc.add(GetLocation()),
    wait: const Duration(seconds: 3),
    expect: () => [isA<LocationLoadingState>(), isA<LocationSucessState>()],
  );

  blocTest<LocationBloc, LocationState>(
    'emits [LocationSucessState] when GetLocationFromAddress is a successs',
    build: () => LocationBloc(mockRepository),
    act: (bloc) =>
        bloc.add(GetLocationFromAddress(SearchAddress(NotNullString('')))),
    wait: const Duration(seconds: 3),
    expect: () => [isA<LocationSucessState>()],
  );

  blocTest<LocationBloc, LocationState>(
    'emits [LocationLoadingState, LocationErrorState] when have a Error with GetLocation event',
    build: () => LocationBloc(errorMockRepository),
    act: (bloc) => bloc.add(GetLocation()),
    wait: const Duration(seconds: 3),
    expect: () => [isA<LocationLoadingState>(), isA<LocationErrorState>()],
  );

  blocTest<LocationBloc, LocationState>(
    'emits [LocationErrorState] when GetLocationFromAddress is a Error',
    build: () => LocationBloc(errorMockRepository),
    act: (bloc) =>
        bloc.add(GetLocationFromAddress(SearchAddress(NotNullString('')))),
    wait: const Duration(seconds: 3),
    expect: () => [isA<LocationErrorState>()],
  );
}
