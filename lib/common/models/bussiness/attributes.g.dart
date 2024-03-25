// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attributes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttributesImpl _$$AttributesImplFromJson(Map<String, dynamic> json) =>
    _$AttributesImpl(
      businessTempClosed: json['business_temp_closed'],
      menuUrl: json['menu_url'] as String?,
      open24Hours: json['open24_hours'],
      waitlistReservation: json['waitlist_reservation'] as bool?,
    );

Map<String, dynamic> _$$AttributesImplToJson(_$AttributesImpl instance) =>
    <String, dynamic>{
      'business_temp_closed': instance.businessTempClosed,
      'menu_url': instance.menuUrl,
      'open24_hours': instance.open24Hours,
      'waitlist_reservation': instance.waitlistReservation,
    };
