// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autocomplete.request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AutocompleteRequestModelImpl _$$AutocompleteRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AutocompleteRequestModelImpl(
      text: json['text'] as String,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      locale: json['locale'] as String?,
    );

Map<String, dynamic> _$$AutocompleteRequestModelImplToJson(
        _$AutocompleteRequestModelImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'locale': instance.locale,
    };
