// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bussiness.req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BussinessReqModelImpl _$$BussinessReqModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BussinessReqModelImpl(
      location: json['location'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      locale: json['locale'] as String?,
      term: json['term'] as String?,
      radius: json['radius'] as int?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      attributes: (json['attributes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      limit: json['limit'] as int?,
      offset: json['offset'] as int?,
    );

Map<String, dynamic> _$$BussinessReqModelImplToJson(
    _$BussinessReqModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('location', instance.location);
  writeNotNull('latitude', instance.latitude);
  writeNotNull('longitude', instance.longitude);
  writeNotNull('locale', instance.locale);
  writeNotNull('term', instance.term);
  writeNotNull('radius', instance.radius);
  writeNotNull('categories', instance.categories);
  writeNotNull('attributes', instance.attributes);
  writeNotNull('limit', instance.limit);
  writeNotNull('offset', instance.offset);
  return val;
}
