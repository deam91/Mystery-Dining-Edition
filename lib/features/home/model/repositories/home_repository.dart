import 'package:mystery_dining_edition/common/http/api_provider.dart';
import 'package:mystery_dining_edition/features/home/model/data/autocomplete.request.dart';
import 'package:mystery_dining_edition/features/home/model/data/autocomplete.response.dart';
import 'package:mystery_dining_edition/features/home/model/data/bussiness.req.dart';
import 'package:mystery_dining_edition/features/home/model/data/bussiness.res.dart';

abstract class IHomeRepository {
  Future<AutocompleteResponseModel?> autocomplete(
    AutocompleteRequestModel requestModel,
  );
  Future<BussinessResModel?> getMysterySuggestion(
    BussinessReqModel requestModel,
  );
}

class HomeRepository implements IHomeRepository {
  HomeRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  @override
  Future<AutocompleteResponseModel?> autocomplete(
    AutocompleteRequestModel requestModel,
  ) async {
    try {
      final resp = await apiProvider.requestGet<AutocompleteResponseModel>(
        'autocomplete',
        query: requestModel.toJson(),
        fromJson: (json) =>
            AutocompleteResponseModel.fromJson(json as Map<String, dynamic>),
      );
      if (resp.error != null) {
        throw Exception();
      }
      return resp.data;
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<BussinessResModel?> getMysterySuggestion(
    BussinessReqModel requestModel,
  ) async {
    try {
      final resp = await apiProvider.requestGet<BussinessResModel>(
        'businesses/search',
        query: requestModel.toJson(),
        fromJson: (json) =>
            BussinessResModel.fromJson(json as Map<String, dynamic>),
      );
      if (resp.error != null) {
        throw Exception();
      }
      return resp.data;
    } on Exception {
      rethrow;
    }
  }
}
