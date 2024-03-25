import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class Category with _$Category {
  factory Category({
    String? alias,
    String? title,
  }) = _Category;

  factory Category.empty() => Category(
        alias: '',
        title: '',
      );

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
