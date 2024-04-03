import 'package:freezed_annotation/freezed_annotation.dart';

part 'autocomplete.request.freezed.dart';
part 'autocomplete.request.g.dart';

@freezed
class AutocompleteRequestModel with _$AutocompleteRequestModel {
  const factory AutocompleteRequestModel({
    required String text,
    @JsonKey(includeIfNull: false) double? latitude,
    @JsonKey(includeIfNull: false) double? longitude,
    @JsonKey(includeIfNull: false) String? locale,
  }) = _AutocompleteRequestModel;

  factory AutocompleteRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AutocompleteRequestModelFromJson(json);
}
