import 'package:equatable/equatable.dart';

import 'package:wather_app/domain/entities/location.dart';

class HomepageState extends Equatable {
  HomepageState({
    required this.locationsResult,
    this.loadingLocations = false,
    this.loadingForecast = false,
    this.error = '',
  });

  final List<Location> locationsResult;
  final bool loadingLocations;
  final bool loadingForecast;
  final String error;
  Location? selectedLocation;

  static HomepageState get initial => HomepageState(locationsResult: []);

  void setLocation(Location? loc) {
    selectedLocation = loc;
  }

  @override
  List<Object?> get props => [
        locationsResult,
        loadingLocations,
        loadingForecast,
        selectedLocation,
        error,
      ];

  HomepageState copyWith({
    List<Location>? locationsResult,
    Location? selectedLocation,
    bool? loadingLocations,
    bool? loadingForecast,
    String? error,
  }) {
    return HomepageState(
      locationsResult: locationsResult ?? this.locationsResult,
      loadingLocations: loadingLocations ?? this.loadingLocations,
      loadingForecast: loadingForecast ?? this.loadingForecast,
      error: error ?? this.error,
    )..setLocation(selectedLocation);
  }
}
