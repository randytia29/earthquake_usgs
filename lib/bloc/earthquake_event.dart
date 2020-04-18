import 'package:meta/meta.dart';

@immutable
abstract class EarthquakeEvent {}

class FetchEarthquakeEvent extends EarthquakeEvent {
  final int minMagnitude;

  FetchEarthquakeEvent({this.minMagnitude});
}
