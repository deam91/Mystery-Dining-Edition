// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationImpl _$$LocationImplFromJson(Map<String, dynamic> json) =>
    _$LocationImpl(
      address1: json['address1'] as String?,
      address2: json['address2'] as String?,
      address3: json['address3'] as String?,
      city: json['city'] as String?,
      zipCode: json['zip_code'] as String?,
      country: json['country'] as String?,
      state: json['state'] as String?,
      displayAddress: (json['display_address'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$LocationImplToJson(_$LocationImpl instance) =>
    <String, dynamic>{
      'address1': instance.address1,
      'address2': instance.address2,
      'address3': instance.address3,
      'city': instance.city,
      'zip_code': instance.zipCode,
      'country': instance.country,
      'state': instance.state,
      'display_address': instance.displayAddress,
    };
