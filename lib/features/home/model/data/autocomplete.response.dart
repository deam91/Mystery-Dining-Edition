import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mystery_dining_edition/features/home/model/data/autocomplete.terms.resp.dart';

part 'autocomplete.response.freezed.dart';
part 'autocomplete.response.g.dart';

@freezed
class AutocompleteResponseModel with _$AutocompleteResponseModel {
  const factory AutocompleteResponseModel({
    required List<AutocompleteTermsRespModel> terms,
  }) = _AutocompleteResponseModel;

  factory AutocompleteResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AutocompleteResponseModelFromJson(json);
}
