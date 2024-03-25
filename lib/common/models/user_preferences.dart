// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:mystery_dining_edition/common/enums.dart';

part 'user_preferences.g.dart';

@HiveType(typeId: 6)
class UserPreferencesModel extends HiveObject {
  UserPreferencesModel(
    this.selectedCousines,
    this.selectedCategories,
    this.selectedLocale,
  );
  @HiveField(0)
  final List<String> selectedCousines;
  @HiveField(1)
  final List<CategoryTypes> selectedCategories;
  @HiveField(2)
  final LocaleInfo? selectedLocale;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'selectedCousines': selectedCousines,
      'selectedCategories': selectedCategories.map((x) => x.toMap()).toList(),
      'selectedLocale': selectedLocale?.toMap(),
    };
  }

  factory UserPreferencesModel.fromMap(Map<String, dynamic> map) {
    print('MAP: $map');
    return UserPreferencesModel(
      (map['selectedCousines'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      List<CategoryTypes>.from(
        (map['selectedCategories'] as List<dynamic>? ?? []).map<CategoryTypes>(
          (x) => CategoryTypes.deals.fromMap(x as Map<String, dynamic>),
        ),
      ),
      map['selectedLocale'] != null
          ? LocaleInfo.fromMap(map['selectedLocale'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserPreferencesModel.fromJson(String source) =>
      UserPreferencesModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
