import 'package:freezed_annotation/freezed_annotation.dart';

part 'bussiness.req.freezed.dart';
part 'bussiness.req.g.dart';

@freezed
class BussinessReqModel with _$BussinessReqModel {
  @JsonSerializable(includeIfNull: false)
  const factory BussinessReqModel({
    @JsonKey(includeIfNull: false) String? location,
    @JsonKey(includeIfNull: false) double? latitude,
    @JsonKey(includeIfNull: false) double? longitude,
    @JsonKey(includeIfNull: false) String? locale,
    @JsonKey(includeIfNull: false) String? term,
    @JsonKey(includeIfNull: false) int? radius,
    @JsonKey(includeIfNull: false) List<String>? categories,
    @JsonKey(includeIfNull: false) List<String>? attributes,
    @JsonKey(includeIfNull: false) int? limit,
    @JsonKey(includeIfNull: false) int? offset,
  }) = _BussinessReqModel;

  factory BussinessReqModel.fromJson(Map<String, dynamic> json) =>
      _$BussinessReqModelFromJson(json);
}
