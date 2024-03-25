import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';
part 'location.g.dart';

@freezed
class Location with _$Location {
  factory Location({
    String? address1,
    String? address2,
    String? address3,
    String? city,
    @JsonKey(name: 'zip_code') String? zipCode,
    String? country,
    String? state,
    @JsonKey(name: 'display_address') List<String>? displayAddress,
  }) = _Location;

  factory Location.empty() => Location(
        address1: '',
        address2: '',
        address3: '',
        city: '',
        zipCode: '',
        country: '',
        state: '',
        displayAddress: [],
      );

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
