// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bussiness.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Bussiness _$BussinessFromJson(Map<String, dynamic> json) {
  return _Bussiness.fromJson(json);
}

/// @nodoc
mixin _$Bussiness {
  String? get id => throw _privateConstructorUsedError;
  String? get alias => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_closed')
  bool? get isClosed => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'review_count')
  int? get reviewCount => throw _privateConstructorUsedError;
  List<Category>? get categories => throw _privateConstructorUsedError;
  double? get rating => throw _privateConstructorUsedError;
  Coordinates? get coordinates => throw _privateConstructorUsedError;
  List<String>? get transactions => throw _privateConstructorUsedError;
  List<String>? get photos => throw _privateConstructorUsedError;
  Location? get location => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'display_phone')
  String? get displayPhone => throw _privateConstructorUsedError;
  double? get distance => throw _privateConstructorUsedError;
  Attributes? get attributes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BussinessCopyWith<Bussiness> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BussinessCopyWith<$Res> {
  factory $BussinessCopyWith(Bussiness value, $Res Function(Bussiness) then) =
      _$BussinessCopyWithImpl<$Res, Bussiness>;
  @useResult
  $Res call(
      {String? id,
      String? alias,
      String? name,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'is_closed') bool? isClosed,
      String? url,
      @JsonKey(name: 'review_count') int? reviewCount,
      List<Category>? categories,
      double? rating,
      Coordinates? coordinates,
      List<String>? transactions,
      List<String>? photos,
      Location? location,
      String? phone,
      @JsonKey(name: 'display_phone') String? displayPhone,
      double? distance,
      Attributes? attributes});

  $CoordinatesCopyWith<$Res>? get coordinates;
  $LocationCopyWith<$Res>? get location;
  $AttributesCopyWith<$Res>? get attributes;
}

/// @nodoc
class _$BussinessCopyWithImpl<$Res, $Val extends Bussiness>
    implements $BussinessCopyWith<$Res> {
  _$BussinessCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? alias = freezed,
    Object? name = freezed,
    Object? imageUrl = freezed,
    Object? isClosed = freezed,
    Object? url = freezed,
    Object? reviewCount = freezed,
    Object? categories = freezed,
    Object? rating = freezed,
    Object? coordinates = freezed,
    Object? transactions = freezed,
    Object? photos = freezed,
    Object? location = freezed,
    Object? phone = freezed,
    Object? displayPhone = freezed,
    Object? distance = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      alias: freezed == alias
          ? _value.alias
          : alias // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isClosed: freezed == isClosed
          ? _value.isClosed
          : isClosed // ignore: cast_nullable_to_non_nullable
              as bool?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      reviewCount: freezed == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int?,
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      coordinates: freezed == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as Coordinates?,
      transactions: freezed == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      photos: freezed == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      displayPhone: freezed == displayPhone
          ? _value.displayPhone
          : displayPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      attributes: freezed == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Attributes?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CoordinatesCopyWith<$Res>? get coordinates {
    if (_value.coordinates == null) {
      return null;
    }

    return $CoordinatesCopyWith<$Res>(_value.coordinates!, (value) {
      return _then(_value.copyWith(coordinates: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $LocationCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AttributesCopyWith<$Res>? get attributes {
    if (_value.attributes == null) {
      return null;
    }

    return $AttributesCopyWith<$Res>(_value.attributes!, (value) {
      return _then(_value.copyWith(attributes: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BussinessImplCopyWith<$Res>
    implements $BussinessCopyWith<$Res> {
  factory _$$BussinessImplCopyWith(
          _$BussinessImpl value, $Res Function(_$BussinessImpl) then) =
      __$$BussinessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? alias,
      String? name,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'is_closed') bool? isClosed,
      String? url,
      @JsonKey(name: 'review_count') int? reviewCount,
      List<Category>? categories,
      double? rating,
      Coordinates? coordinates,
      List<String>? transactions,
      List<String>? photos,
      Location? location,
      String? phone,
      @JsonKey(name: 'display_phone') String? displayPhone,
      double? distance,
      Attributes? attributes});

  @override
  $CoordinatesCopyWith<$Res>? get coordinates;
  @override
  $LocationCopyWith<$Res>? get location;
  @override
  $AttributesCopyWith<$Res>? get attributes;
}

/// @nodoc
class __$$BussinessImplCopyWithImpl<$Res>
    extends _$BussinessCopyWithImpl<$Res, _$BussinessImpl>
    implements _$$BussinessImplCopyWith<$Res> {
  __$$BussinessImplCopyWithImpl(
      _$BussinessImpl _value, $Res Function(_$BussinessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? alias = freezed,
    Object? name = freezed,
    Object? imageUrl = freezed,
    Object? isClosed = freezed,
    Object? url = freezed,
    Object? reviewCount = freezed,
    Object? categories = freezed,
    Object? rating = freezed,
    Object? coordinates = freezed,
    Object? transactions = freezed,
    Object? photos = freezed,
    Object? location = freezed,
    Object? phone = freezed,
    Object? displayPhone = freezed,
    Object? distance = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_$BussinessImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      alias: freezed == alias
          ? _value.alias
          : alias // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isClosed: freezed == isClosed
          ? _value.isClosed
          : isClosed // ignore: cast_nullable_to_non_nullable
              as bool?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      reviewCount: freezed == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int?,
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      coordinates: freezed == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as Coordinates?,
      transactions: freezed == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      photos: freezed == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      displayPhone: freezed == displayPhone
          ? _value.displayPhone
          : displayPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      attributes: freezed == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Attributes?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BussinessImpl implements _Bussiness {
  _$BussinessImpl(
      {this.id,
      this.alias,
      this.name,
      @JsonKey(name: 'image_url') this.imageUrl,
      @JsonKey(name: 'is_closed') this.isClosed,
      this.url,
      @JsonKey(name: 'review_count') this.reviewCount,
      final List<Category>? categories,
      this.rating,
      this.coordinates,
      final List<String>? transactions,
      final List<String>? photos,
      this.location,
      this.phone,
      @JsonKey(name: 'display_phone') this.displayPhone,
      this.distance,
      this.attributes})
      : _categories = categories,
        _transactions = transactions,
        _photos = photos;

  factory _$BussinessImpl.fromJson(Map<String, dynamic> json) =>
      _$$BussinessImplFromJson(json);

  @override
  final String? id;
  @override
  final String? alias;
  @override
  final String? name;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @JsonKey(name: 'is_closed')
  final bool? isClosed;
  @override
  final String? url;
  @override
  @JsonKey(name: 'review_count')
  final int? reviewCount;
  final List<Category>? _categories;
  @override
  List<Category>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double? rating;
  @override
  final Coordinates? coordinates;
  final List<String>? _transactions;
  @override
  List<String>? get transactions {
    final value = _transactions;
    if (value == null) return null;
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _photos;
  @override
  List<String>? get photos {
    final value = _photos;
    if (value == null) return null;
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Location? location;
  @override
  final String? phone;
  @override
  @JsonKey(name: 'display_phone')
  final String? displayPhone;
  @override
  final double? distance;
  @override
  final Attributes? attributes;

  @override
  String toString() {
    return 'Bussiness(id: $id, alias: $alias, name: $name, imageUrl: $imageUrl, isClosed: $isClosed, url: $url, reviewCount: $reviewCount, categories: $categories, rating: $rating, coordinates: $coordinates, transactions: $transactions, photos: $photos, location: $location, phone: $phone, displayPhone: $displayPhone, distance: $distance, attributes: $attributes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BussinessImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.alias, alias) || other.alias == alias) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.isClosed, isClosed) ||
                other.isClosed == isClosed) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.coordinates, coordinates) ||
                other.coordinates == coordinates) &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions) &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.displayPhone, displayPhone) ||
                other.displayPhone == displayPhone) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.attributes, attributes) ||
                other.attributes == attributes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      alias,
      name,
      imageUrl,
      isClosed,
      url,
      reviewCount,
      const DeepCollectionEquality().hash(_categories),
      rating,
      coordinates,
      const DeepCollectionEquality().hash(_transactions),
      const DeepCollectionEquality().hash(_photos),
      location,
      phone,
      displayPhone,
      distance,
      attributes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BussinessImplCopyWith<_$BussinessImpl> get copyWith =>
      __$$BussinessImplCopyWithImpl<_$BussinessImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BussinessImplToJson(
      this,
    );
  }
}

abstract class _Bussiness implements Bussiness {
  factory _Bussiness(
      {final String? id,
      final String? alias,
      final String? name,
      @JsonKey(name: 'image_url') final String? imageUrl,
      @JsonKey(name: 'is_closed') final bool? isClosed,
      final String? url,
      @JsonKey(name: 'review_count') final int? reviewCount,
      final List<Category>? categories,
      final double? rating,
      final Coordinates? coordinates,
      final List<String>? transactions,
      final List<String>? photos,
      final Location? location,
      final String? phone,
      @JsonKey(name: 'display_phone') final String? displayPhone,
      final double? distance,
      final Attributes? attributes}) = _$BussinessImpl;

  factory _Bussiness.fromJson(Map<String, dynamic> json) =
      _$BussinessImpl.fromJson;

  @override
  String? get id;
  @override
  String? get alias;
  @override
  String? get name;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  @JsonKey(name: 'is_closed')
  bool? get isClosed;
  @override
  String? get url;
  @override
  @JsonKey(name: 'review_count')
  int? get reviewCount;
  @override
  List<Category>? get categories;
  @override
  double? get rating;
  @override
  Coordinates? get coordinates;
  @override
  List<String>? get transactions;
  @override
  List<String>? get photos;
  @override
  Location? get location;
  @override
  String? get phone;
  @override
  @JsonKey(name: 'display_phone')
  String? get displayPhone;
  @override
  double? get distance;
  @override
  Attributes? get attributes;
  @override
  @JsonKey(ignore: true)
  _$$BussinessImplCopyWith<_$BussinessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
