// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'autocomplete.terms.resp.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AutocompleteTermsRespModel _$AutocompleteTermsRespModelFromJson(
    Map<String, dynamic> json) {
  return _AutocompleteTermsRespModel.fromJson(json);
}

/// @nodoc
mixin _$AutocompleteTermsRespModel {
  String get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AutocompleteTermsRespModelCopyWith<AutocompleteTermsRespModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AutocompleteTermsRespModelCopyWith<$Res> {
  factory $AutocompleteTermsRespModelCopyWith(AutocompleteTermsRespModel value,
          $Res Function(AutocompleteTermsRespModel) then) =
      _$AutocompleteTermsRespModelCopyWithImpl<$Res,
          AutocompleteTermsRespModel>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class _$AutocompleteTermsRespModelCopyWithImpl<$Res,
        $Val extends AutocompleteTermsRespModel>
    implements $AutocompleteTermsRespModelCopyWith<$Res> {
  _$AutocompleteTermsRespModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AutocompleteTermsRespModelImplCopyWith<$Res>
    implements $AutocompleteTermsRespModelCopyWith<$Res> {
  factory _$$AutocompleteTermsRespModelImplCopyWith(
          _$AutocompleteTermsRespModelImpl value,
          $Res Function(_$AutocompleteTermsRespModelImpl) then) =
      __$$AutocompleteTermsRespModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$AutocompleteTermsRespModelImplCopyWithImpl<$Res>
    extends _$AutocompleteTermsRespModelCopyWithImpl<$Res,
        _$AutocompleteTermsRespModelImpl>
    implements _$$AutocompleteTermsRespModelImplCopyWith<$Res> {
  __$$AutocompleteTermsRespModelImplCopyWithImpl(
      _$AutocompleteTermsRespModelImpl _value,
      $Res Function(_$AutocompleteTermsRespModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$AutocompleteTermsRespModelImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AutocompleteTermsRespModelImpl implements _AutocompleteTermsRespModel {
  const _$AutocompleteTermsRespModelImpl({required this.text});

  factory _$AutocompleteTermsRespModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AutocompleteTermsRespModelImplFromJson(json);

  @override
  final String text;

  @override
  String toString() {
    return 'AutocompleteTermsRespModel(text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AutocompleteTermsRespModelImpl &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AutocompleteTermsRespModelImplCopyWith<_$AutocompleteTermsRespModelImpl>
      get copyWith => __$$AutocompleteTermsRespModelImplCopyWithImpl<
          _$AutocompleteTermsRespModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AutocompleteTermsRespModelImplToJson(
      this,
    );
  }
}

abstract class _AutocompleteTermsRespModel
    implements AutocompleteTermsRespModel {
  const factory _AutocompleteTermsRespModel({required final String text}) =
      _$AutocompleteTermsRespModelImpl;

  factory _AutocompleteTermsRespModel.fromJson(Map<String, dynamic> json) =
      _$AutocompleteTermsRespModelImpl.fromJson;

  @override
  String get text;
  @override
  @JsonKey(ignore: true)
  _$$AutocompleteTermsRespModelImplCopyWith<_$AutocompleteTermsRespModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
