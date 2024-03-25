import 'package:freezed_annotation/freezed_annotation.dart';

part 'coordinates.freezed.dart';
part 'coordinates.g.dart';

@freezed
class Coordinates with _$Coordinates {
  factory Coordinates({
    double? latitude,
    double? longitude,
  }) = _Coordinates;

  factory Coordinates.empty() => Coordinates(
        latitude: 0,
        longitude: 0,
      );

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);
}
