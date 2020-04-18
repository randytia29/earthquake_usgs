import 'package:earthquakeusgs/model/earthquake.dart';
import 'package:meta/meta.dart';

@immutable
abstract class EarthquakeState {}

class EarthquakeInitialState extends EarthquakeState {}

class EarthquakeLoaded extends EarthquakeState {
  final List<Feature> feature;

  EarthquakeLoaded({this.feature});
}
