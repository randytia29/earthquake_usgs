import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:earthquakeusgs/model/earthquake.dart';
import './bloc.dart';

class EarthquakeBloc extends Bloc<EarthquakeEvent, EarthquakeState> {
  @override
  EarthquakeState get initialState => EarthquakeInitialState();

  @override
  Stream<EarthquakeState> mapEventToState(
    EarthquakeEvent event,
  ) async* {
    List<Feature> feature;
    if (state is EarthquakeInitialState) {
      if (event is FetchEarthquakeEvent) {
        feature = await ModelEarthquake.getFeature(event.minMagnitude);
        yield EarthquakeLoaded(feature: feature);
      }
    }
  }
}
