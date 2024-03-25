import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mystery_dining_edition/common/models/bussiness/bussiness.dart';

part 'bussiness.res.freezed.dart';
part 'bussiness.res.g.dart';

@freezed
class BussinessResModel with _$BussinessResModel {
  const factory BussinessResModel({
    List<Bussiness>? businesses,
  }) = _BussinessResModel;

  factory BussinessResModel.fromJson(Map<String, dynamic> json) =>
      _$BussinessResModelFromJson(json);
}
