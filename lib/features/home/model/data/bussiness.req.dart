import 'package:freezed_annotation/freezed_annotation.dart';

part 'bussiness.req.freezed.dart';
part 'bussiness.req.g.dart';

@freezed
class BussinessReqModel with _$BussinessReqModel {
  @JsonSerializable(includeIfNull: false)
  const factory BussinessReqModel({
    String? location,
    double? latitude,
    double? longitude,
    String? locale,
    String? term,
    int? radius,
    List<String>? categories,
    List<String>? attributes,
    int? limit,
    int? offset,
  }) = _BussinessReqModel;

  factory BussinessReqModel.fromJson(Map<String, dynamic> json) =>
      _$BussinessReqModelFromJson(json);
}
