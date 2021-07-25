import 'package:wather_app/domain/entities/location.dart';
import 'package:wather_app/domain/repositories/location_repository.dart';

class SearchLocationUseCase {
  SearchLocationUseCase(this._repository);

  final LocationRepository _repository;

  Future<List<Location>> call(String text) {
    if (text.isEmpty) return Future.value([]);
    return _repository.searchLocation(text);
  }
}
