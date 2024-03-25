import 'package:freezed_annotation/freezed_annotation.dart';

part 'attributes.freezed.dart';
part 'attributes.g.dart';

@freezed
class Attributes with _$Attributes {
  factory Attributes({
    @JsonKey(name: 'business_temp_closed') dynamic businessTempClosed,
    @JsonKey(name: 'menu_url') String? menuUrl,
    @JsonKey(name: 'open24_hours') dynamic open24Hours,
    @JsonKey(name: 'waitlist_reservation') bool? waitlistReservation,
  }) = _Attributes;

  factory Attributes.empty() => Attributes(
        businessTempClosed: '',
        menuUrl: '',
        open24Hours: '',
        waitlistReservation: false,
      );

  factory Attributes.fromJson(Map<String, dynamic> json) =>
      _$AttributesFromJson(json);
}
