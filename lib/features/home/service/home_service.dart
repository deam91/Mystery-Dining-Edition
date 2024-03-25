import 'package:mystery_dining_edition/common/models/bussiness/bussiness.dart';
import 'package:mystery_dining_edition/features/home/model/data/autocomplete.request.dart';
import 'package:mystery_dining_edition/features/home/model/data/bussiness.req.dart';
import 'package:mystery_dining_edition/features/home/model/repositories/home_repository.dart';

class HomeService {
  HomeService({required this.repository});

  final IHomeRepository repository;

  Future<List<String>> autocomplete({
    required String text,
    double? latitude,
    double? longitude,
    String? locale,
  }) async {
    final model = AutocompleteRequestModel(
      text: text,
      latitude: latitude,
      longitude: longitude,
      locale: locale,
    );
    final resp = await repository.autocomplete(model);
    if (resp != null) {
      return resp.terms.map((e) => e.text).toList();
    }

    return [];
  }

  Future<List<Bussiness>?> getMysterySuggestion({
    String? location,
    double? latitude,
    double? longitude,
    String? locale,
    String? term,
    int? radius,
    List<String>? categories,
    List<String>? attributes,
    int limit = 1,
    int? offset,
  }) async {
    final model = BussinessReqModel(
      location: location,
      latitude: latitude,
      longitude: longitude,
      locale: locale,
      term: term,
      radius: radius,
      categories: categories,
      attributes: attributes,
      limit: limit,
      offset: offset,
    );
    final resp = await repository.getMysterySuggestion(model);
    if (resp != null) {
      return resp.businesses;
    }
    return null;
  }
}
