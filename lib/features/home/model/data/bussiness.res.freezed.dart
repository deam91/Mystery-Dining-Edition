// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bussiness.res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BussinessResModel _$BussinessResModelFromJson(Map<String, dynamic> json) {
  return _BussinessResModel.fromJson(json);
}

/// @nodoc
mixin _$BussinessResModel {
  List<Bussiness>? get businesses => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BussinessResModelCopyWith<BussinessResModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BussinessResModelCopyWith<$Res> {
  factory $BussinessResModelCopyWith(
          BussinessResModel value, $Res Function(BussinessResModel) then) =
      _$BussinessResModelCopyWithImpl<$Res, BussinessResModel>;
  @useResult
  $Res call({List<Bussiness>? businesses});
}

/// @nodoc
class _$BussinessResModelCopyWithImpl<$Res, $Val extends BussinessResModel>
    implements $BussinessResModelCopyWith<$Res> {
  _$BussinessResModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? businesses = freezed,
  }) {
    return _then(_value.copyWith(
      businesses: freezed == businesses
          ? _value.businesses
          : businesses // ignore: cast_nullable_to_non_nullable
              as List<Bussiness>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BussinessResModelImplCopyWith<$Res>
    implements $BussinessResModelCopyWith<$Res> {
  factory _$$BussinessResModelImplCopyWith(_$BussinessResModelImpl value,
          $Res Function(_$BussinessResModelImpl) then) =
      __$$BussinessResModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Bussiness>? businesses});
}

/// @nodoc
class __$$BussinessResModelImplCopyWithImpl<$Res>
    extends _$BussinessResModelCopyWithImpl<$Res, _$BussinessResModelImpl>
    implements _$$BussinessResModelImplCopyWith<$Res> {
  __$$BussinessResModelImplCopyWithImpl(_$BussinessResModelImpl _value,
      $Res Function(_$BussinessResModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? businesses = freezed,
  }) {
    return _then(_$BussinessResModelImpl(
      businesses: freezed == businesses
          ? _value._businesses
          : businesses // ignore: cast_nullable_to_non_nullable
              as List<Bussiness>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BussinessResModelImpl implements _BussinessResModel {
  const _$BussinessResModelImpl({final List<Bussiness>? businesses})
      : _businesses = businesses;

  factory _$BussinessResModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BussinessResModelImplFromJson(json);

  final List<Bussiness>? _businesses;
  @override
  List<Bussiness>? get businesses {
    final value = _businesses;
    if (value == null) return null;
    if (_businesses is EqualUnmodifiableListView) return _businesses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BussinessResModel(businesses: $businesses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BussinessResModelImpl &&
            const DeepCollectionEquality()
                .equals(other._businesses, _businesses));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_businesses));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BussinessResModelImplCopyWith<_$BussinessResModelImpl> get copyWith =>
      __$$BussinessResModelImplCopyWithImpl<_$BussinessResModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BussinessResModelImplToJson(
      this,
    );
  }
}

abstract class _BussinessResModel implements BussinessResModel {
  const factory _BussinessResModel({final List<Bussiness>? businesses}) =
      _$BussinessResModelImpl;

  factory _BussinessResModel.fromJson(Map<String, dynamic> json) =
      _$BussinessResModelImpl.fromJson;

  @override
  List<Bussiness>? get businesses;
  @override
  @JsonKey(ignore: true)
  _$$BussinessResModelImplCopyWith<_$BussinessResModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
