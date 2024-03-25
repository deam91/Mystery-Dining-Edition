// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bussiness.res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BussinessResModelImpl _$$BussinessResModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BussinessResModelImpl(
      businesses: (json['businesses'] as List<dynamic>?)
          ?.map((e) => Bussiness.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BussinessResModelImplToJson(
        _$BussinessResModelImpl instance) =>
    <String, dynamic>{
      'businesses': instance.businesses,
    };
