// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'autocomplete.request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AutocompleteRequestModel _$AutocompleteRequestModelFromJson(
    Map<String, dynamic> json) {
  return _AutocompleteRequestModel.fromJson(json);
}

/// @nodoc
mixin _$AutocompleteRequestModel {
  String get text => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  double? get latitude => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  double? get longitude => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get locale => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AutocompleteRequestModelCopyWith<AutocompleteRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AutocompleteRequestModelCopyWith<$Res> {
  factory $AutocompleteRequestModelCopyWith(AutocompleteRequestModel value,
          $Res Function(AutocompleteRequestModel) then) =
      _$AutocompleteRequestModelCopyWithImpl<$Res, AutocompleteRequestModel>;
  @useResult
  $Res call(
      {String text,
      @JsonKey(includeIfNull: false) double? latitude,
      @JsonKey(includeIfNull: false) double? longitude,
      @JsonKey(includeIfNull: false) String? locale});
}

/// @nodoc
class _$AutocompleteRequestModelCopyWithImpl<$Res,
        $Val extends AutocompleteRequestModel>
    implements $AutocompleteRequestModelCopyWith<$Res> {
  _$AutocompleteRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? locale = freezed,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AutocompleteRequestModelImplCopyWith<$Res>
    implements $AutocompleteRequestModelCopyWith<$Res> {
  factory _$$AutocompleteRequestModelImplCopyWith(
          _$AutocompleteRequestModelImpl value,
          $Res Function(_$AutocompleteRequestModelImpl) then) =
      __$$AutocompleteRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String text,
      @JsonKey(includeIfNull: false) double? latitude,
      @JsonKey(includeIfNull: false) double? longitude,
      @JsonKey(includeIfNull: false) String? locale});
}

/// @nodoc
class __$$AutocompleteRequestModelImplCopyWithImpl<$Res>
    extends _$AutocompleteRequestModelCopyWithImpl<$Res,
        _$AutocompleteRequestModelImpl>
    implements _$$AutocompleteRequestModelImplCopyWith<$Res> {
  __$$AutocompleteRequestModelImplCopyWithImpl(
      _$AutocompleteRequestModelImpl _value,
      $Res Function(_$AutocompleteRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? locale = freezed,
  }) {
    return _then(_$AutocompleteRequestModelImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AutocompleteRequestModelImpl implements _AutocompleteRequestModel {
  const _$AutocompleteRequestModelImpl(
      {required this.text,
      @JsonKey(includeIfNull: false) this.latitude,
      @JsonKey(includeIfNull: false) this.longitude,
      @JsonKey(includeIfNull: false) this.locale});

  factory _$AutocompleteRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AutocompleteRequestModelImplFromJson(json);

  @override
  final String text;
  @override
  @JsonKey(includeIfNull: false)
  final double? latitude;
  @override
  @JsonKey(includeIfNull: false)
  final double? longitude;
  @override
  @JsonKey(includeIfNull: false)
  final String? locale;

  @override
  String toString() {
    return 'AutocompleteRequestModel(text: $text, latitude: $latitude, longitude: $longitude, locale: $locale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AutocompleteRequestModelImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, text, latitude, longitude, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AutocompleteRequestModelImplCopyWith<_$AutocompleteRequestModelImpl>
      get copyWith => __$$AutocompleteRequestModelImplCopyWithImpl<
          _$AutocompleteRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AutocompleteRequestModelImplToJson(
      this,
    );
  }
}

abstract class _AutocompleteRequestModel implements AutocompleteRequestModel {
  const factory _AutocompleteRequestModel(
          {required final String text,
          @JsonKey(includeIfNull: false) final double? latitude,
          @JsonKey(includeIfNull: false) final double? longitude,
          @JsonKey(includeIfNull: false) final String? locale}) =
      _$AutocompleteRequestModelImpl;

  factory _AutocompleteRequestModel.fromJson(Map<String, dynamic> json) =
      _$AutocompleteRequestModelImpl.fromJson;

  @override
  String get text;
  @override
  @JsonKey(includeIfNull: false)
  double? get latitude;
  @override
  @JsonKey(includeIfNull: false)
  double? get longitude;
  @override
  @JsonKey(includeIfNull: false)
  String? get locale;
  @override
  @JsonKey(ignore: true)
  _$$AutocompleteRequestModelImplCopyWith<_$AutocompleteRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
