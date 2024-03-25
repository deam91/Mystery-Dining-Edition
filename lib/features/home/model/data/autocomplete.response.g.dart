// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autocomplete.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AutocompleteResponseModelImpl _$$AutocompleteResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AutocompleteResponseModelImpl(
      terms: (json['terms'] as List<dynamic>)
          .map((e) =>
              AutocompleteTermsRespModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AutocompleteResponseModelImplToJson(
        _$AutocompleteResponseModelImpl instance) =>
    <String, dynamic>{
      'terms': instance.terms,
    };
