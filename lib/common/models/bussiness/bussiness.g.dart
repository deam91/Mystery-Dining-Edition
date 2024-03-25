// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bussiness.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BussinessImpl _$$BussinessImplFromJson(Map<String, dynamic> json) =>
    _$BussinessImpl(
      id: json['id'] as String?,
      alias: json['alias'] as String?,
      name: json['name'] as String?,
      imageUrl: json['image_url'] as String?,
      isClosed: json['is_closed'] as bool?,
      url: json['url'] as String?,
      reviewCount: json['review_count'] as int?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      rating: (json['rating'] as num?)?.toDouble(),
      coordinates: json['coordinates'] == null
          ? null
          : Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
      transactions: (json['transactions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      photos:
          (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList(),
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      phone: json['phone'] as String?,
      displayPhone: json['display_phone'] as String?,
      distance: (json['distance'] as num?)?.toDouble(),
      attributes: json['attributes'] == null
          ? null
          : Attributes.fromJson(json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BussinessImplToJson(_$BussinessImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'alias': instance.alias,
      'name': instance.name,
      'image_url': instance.imageUrl,
      'is_closed': instance.isClosed,
      'url': instance.url,
      'review_count': instance.reviewCount,
      'categories': instance.categories,
      'rating': instance.rating,
      'coordinates': instance.coordinates,
      'transactions': instance.transactions,
      'photos': instance.photos,
      'location': instance.location,
      'phone': instance.phone,
      'display_phone': instance.displayPhone,
      'distance': instance.distance,
      'attributes': instance.attributes,
    };
