import 'package:freezed_annotation/freezed_annotation.dart';

part 'autocomplete.terms.resp.freezed.dart';
part 'autocomplete.terms.resp.g.dart';

@freezed
class AutocompleteTermsRespModel with _$AutocompleteTermsRespModel {
  const factory AutocompleteTermsRespModel({
    required String text,
  }) = _AutocompleteTermsRespModel;

  factory AutocompleteTermsRespModel.fromJson(Map<String, dynamic> json) =>
      _$AutocompleteTermsRespModelFromJson(json);
}
