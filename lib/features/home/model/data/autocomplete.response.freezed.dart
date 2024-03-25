// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'autocomplete.response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AutocompleteResponseModel _$AutocompleteResponseModelFromJson(
    Map<String, dynamic> json) {
  return _AutocompleteResponseModel.fromJson(json);
}

/// @nodoc
mixin _$AutocompleteResponseModel {
  List<AutocompleteTermsRespModel> get terms =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AutocompleteResponseModelCopyWith<AutocompleteResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AutocompleteResponseModelCopyWith<$Res> {
  factory $AutocompleteResponseModelCopyWith(AutocompleteResponseModel value,
          $Res Function(AutocompleteResponseModel) then) =
      _$AutocompleteResponseModelCopyWithImpl<$Res, AutocompleteResponseModel>;
  @useResult
  $Res call({List<AutocompleteTermsRespModel> terms});
}

/// @nodoc
class _$AutocompleteResponseModelCopyWithImpl<$Res,
        $Val extends AutocompleteResponseModel>
    implements $AutocompleteResponseModelCopyWith<$Res> {
  _$AutocompleteResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? terms = null,
  }) {
    return _then(_value.copyWith(
      terms: null == terms
          ? _value.terms
          : terms // ignore: cast_nullable_to_non_nullable
              as List<AutocompleteTermsRespModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AutocompleteResponseModelImplCopyWith<$Res>
    implements $AutocompleteResponseModelCopyWith<$Res> {
  factory _$$AutocompleteResponseModelImplCopyWith(
          _$AutocompleteResponseModelImpl value,
          $Res Function(_$AutocompleteResponseModelImpl) then) =
      __$$AutocompleteResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AutocompleteTermsRespModel> terms});
}

/// @nodoc
class __$$AutocompleteResponseModelImplCopyWithImpl<$Res>
    extends _$AutocompleteResponseModelCopyWithImpl<$Res,
        _$AutocompleteResponseModelImpl>
    implements _$$AutocompleteResponseModelImplCopyWith<$Res> {
  __$$AutocompleteResponseModelImplCopyWithImpl(
      _$AutocompleteResponseModelImpl _value,
      $Res Function(_$AutocompleteResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? terms = null,
  }) {
    return _then(_$AutocompleteResponseModelImpl(
      terms: null == terms
          ? _value._terms
          : terms // ignore: cast_nullable_to_non_nullable
              as List<AutocompleteTermsRespModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AutocompleteResponseModelImpl implements _AutocompleteResponseModel {
  const _$AutocompleteResponseModelImpl(
      {required final List<AutocompleteTermsRespModel> terms})
      : _terms = terms;

  factory _$AutocompleteResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AutocompleteResponseModelImplFromJson(json);

  final List<AutocompleteTermsRespModel> _terms;
  @override
  List<AutocompleteTermsRespModel> get terms {
    if (_terms is EqualUnmodifiableListView) return _terms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_terms);
  }

  @override
  String toString() {
    return 'AutocompleteResponseModel(terms: $terms)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AutocompleteResponseModelImpl &&
            const DeepCollectionEquality().equals(other._terms, _terms));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_terms));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AutocompleteResponseModelImplCopyWith<_$AutocompleteResponseModelImpl>
      get copyWith => __$$AutocompleteResponseModelImplCopyWithImpl<
          _$AutocompleteResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AutocompleteResponseModelImplToJson(
      this,
    );
  }
}

abstract class _AutocompleteResponseModel implements AutocompleteResponseModel {
  const factory _AutocompleteResponseModel(
          {required final List<AutocompleteTermsRespModel> terms}) =
      _$AutocompleteResponseModelImpl;

  factory _AutocompleteResponseModel.fromJson(Map<String, dynamic> json) =
      _$AutocompleteResponseModelImpl.fromJson;

  @override
  List<AutocompleteTermsRespModel> get terms;
  @override
  @JsonKey(ignore: true)
  _$$AutocompleteResponseModelImplCopyWith<_$AutocompleteResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
