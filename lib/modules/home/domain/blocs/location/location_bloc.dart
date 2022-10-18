import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ifood_clone/core/extensions/dartz_extension.dart';
import 'package:ifood_clone/modules/home/domain/blocs/location/location_event.dart';
import 'package:ifood_clone/modules/home/domain/blocs/location/location_states.dart';
import 'package:ifood_clone/modules/home/domain/interfaces/i_location_repository.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final ILocationRepository _locationRepository;
  LocationBloc(ILocationRepository locationRepository)
      : _locationRepository = locationRepository,
        super(LocationLoadingState()) {
    on<GetLocation>(_getLocation);
  }

  Future<void> _getLocation(event, emit) async {
    emit(LocationLoadingState());
    final result = await _locationRepository.getCurrentLocation();

    if (result.isLeft()) {
      return emit(LocationErrorState());
    }

    final address = result.right();
    return emit(SucessState(address));
  }
}
