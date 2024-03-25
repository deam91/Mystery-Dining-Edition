import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:mystery_dining_edition/common/models/bussiness/attributes.dart';
import 'package:mystery_dining_edition/common/models/bussiness/category.dart';
import 'package:mystery_dining_edition/common/models/bussiness/coordinates.dart';
import 'package:mystery_dining_edition/common/models/bussiness/location.dart';

part 'bussiness.freezed.dart';
part 'bussiness.g.dart';

@freezed
class Bussiness with _$Bussiness {
  factory Bussiness({
    String? id,
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
    Attributes? attributes,
  }) = _Bussiness;

  factory Bussiness.empty() => Bussiness(
        id: '',
        alias: '',
        name: '',
        imageUrl: '',
        isClosed: false,
        url: '',
        reviewCount: 0,
        categories: [],
        rating: 0,
        coordinates: Coordinates.empty(),
        transactions: [],
        photos: [],
        location: Location.empty(),
        phone: '',
        displayPhone: '',
        distance: 0,
        attributes: Attributes.empty(),
      );

  factory Bussiness.fromJson(Map<String, dynamic> json) =>
      _$BussinessFromJson(json);
}
