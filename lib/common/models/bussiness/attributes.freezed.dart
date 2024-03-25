// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attributes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Attributes _$AttributesFromJson(Map<String, dynamic> json) {
  return _Attributes.fromJson(json);
}

/// @nodoc
mixin _$Attributes {
  @JsonKey(name: 'business_temp_closed')
  dynamic get businessTempClosed => throw _privateConstructorUsedError;
  @JsonKey(name: 'menu_url')
  String? get menuUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'open24_hours')
  dynamic get open24Hours => throw _privateConstructorUsedError;
  @JsonKey(name: 'waitlist_reservation')
  bool? get waitlistReservation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttributesCopyWith<Attributes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttributesCopyWith<$Res> {
  factory $AttributesCopyWith(
          Attributes value, $Res Function(Attributes) then) =
      _$AttributesCopyWithImpl<$Res, Attributes>;
  @useResult
  $Res call(
      {@JsonKey(name: 'business_temp_closed') dynamic businessTempClosed,
      @JsonKey(name: 'menu_url') String? menuUrl,
      @JsonKey(name: 'open24_hours') dynamic open24Hours,
      @JsonKey(name: 'waitlist_reservation') bool? waitlistReservation});
}

/// @nodoc
class _$AttributesCopyWithImpl<$Res, $Val extends Attributes>
    implements $AttributesCopyWith<$Res> {
  _$AttributesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? businessTempClosed = freezed,
    Object? menuUrl = freezed,
    Object? open24Hours = freezed,
    Object? waitlistReservation = freezed,
  }) {
    return _then(_value.copyWith(
      businessTempClosed: freezed == businessTempClosed
          ? _value.businessTempClosed
          : businessTempClosed // ignore: cast_nullable_to_non_nullable
              as dynamic,
      menuUrl: freezed == menuUrl
          ? _value.menuUrl
          : menuUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      open24Hours: freezed == open24Hours
          ? _value.open24Hours
          : open24Hours // ignore: cast_nullable_to_non_nullable
              as dynamic,
      waitlistReservation: freezed == waitlistReservation
          ? _value.waitlistReservation
          : waitlistReservation // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttributesImplCopyWith<$Res>
    implements $AttributesCopyWith<$Res> {
  factory _$$AttributesImplCopyWith(
          _$AttributesImpl value, $Res Function(_$AttributesImpl) then) =
      __$$AttributesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'business_temp_closed') dynamic businessTempClosed,
      @JsonKey(name: 'menu_url') String? menuUrl,
      @JsonKey(name: 'open24_hours') dynamic open24Hours,
      @JsonKey(name: 'waitlist_reservation') bool? waitlistReservation});
}

/// @nodoc
class __$$AttributesImplCopyWithImpl<$Res>
    extends _$AttributesCopyWithImpl<$Res, _$AttributesImpl>
    implements _$$AttributesImplCopyWith<$Res> {
  __$$AttributesImplCopyWithImpl(
      _$AttributesImpl _value, $Res Function(_$AttributesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? businessTempClosed = freezed,
    Object? menuUrl = freezed,
    Object? open24Hours = freezed,
    Object? waitlistReservation = freezed,
  }) {
    return _then(_$AttributesImpl(
      businessTempClosed: freezed == businessTempClosed
          ? _value.businessTempClosed
          : businessTempClosed // ignore: cast_nullable_to_non_nullable
              as dynamic,
      menuUrl: freezed == menuUrl
          ? _value.menuUrl
          : menuUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      open24Hours: freezed == open24Hours
          ? _value.open24Hours
          : open24Hours // ignore: cast_nullable_to_non_nullable
              as dynamic,
      waitlistReservation: freezed == waitlistReservation
          ? _value.waitlistReservation
          : waitlistReservation // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttributesImpl implements _Attributes {
  _$AttributesImpl(
      {@JsonKey(name: 'business_temp_closed') this.businessTempClosed,
      @JsonKey(name: 'menu_url') this.menuUrl,
      @JsonKey(name: 'open24_hours') this.open24Hours,
      @JsonKey(name: 'waitlist_reservation') this.waitlistReservation});

  factory _$AttributesImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttributesImplFromJson(json);

  @override
  @JsonKey(name: 'business_temp_closed')
  final dynamic businessTempClosed;
  @override
  @JsonKey(name: 'menu_url')
  final String? menuUrl;
  @override
  @JsonKey(name: 'open24_hours')
  final dynamic open24Hours;
  @override
  @JsonKey(name: 'waitlist_reservation')
  final bool? waitlistReservation;

  @override
  String toString() {
    return 'Attributes(businessTempClosed: $businessTempClosed, menuUrl: $menuUrl, open24Hours: $open24Hours, waitlistReservation: $waitlistReservation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttributesImpl &&
            const DeepCollectionEquality()
                .equals(other.businessTempClosed, businessTempClosed) &&
            (identical(other.menuUrl, menuUrl) || other.menuUrl == menuUrl) &&
            const DeepCollectionEquality()
                .equals(other.open24Hours, open24Hours) &&
            (identical(other.waitlistReservation, waitlistReservation) ||
                other.waitlistReservation == waitlistReservation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(businessTempClosed),
      menuUrl,
      const DeepCollectionEquality().hash(open24Hours),
      waitlistReservation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttributesImplCopyWith<_$AttributesImpl> get copyWith =>
      __$$AttributesImplCopyWithImpl<_$AttributesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttributesImplToJson(
      this,
    );
  }
}

abstract class _Attributes implements Attributes {
  factory _Attributes(
      {@JsonKey(name: 'business_temp_closed') final dynamic businessTempClosed,
      @JsonKey(name: 'menu_url') final String? menuUrl,
      @JsonKey(name: 'open24_hours') final dynamic open24Hours,
      @JsonKey(name: 'waitlist_reservation')
      final bool? waitlistReservation}) = _$AttributesImpl;

  factory _Attributes.fromJson(Map<String, dynamic> json) =
      _$AttributesImpl.fromJson;

  @override
  @JsonKey(name: 'business_temp_closed')
  dynamic get businessTempClosed;
  @override
  @JsonKey(name: 'menu_url')
  String? get menuUrl;
  @override
  @JsonKey(name: 'open24_hours')
  dynamic get open24Hours;
  @override
  @JsonKey(name: 'waitlist_reservation')
  bool? get waitlistReservation;
  @override
  @JsonKey(ignore: true)
  _$$AttributesImplCopyWith<_$AttributesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
