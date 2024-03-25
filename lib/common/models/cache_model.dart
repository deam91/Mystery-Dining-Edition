import 'package:isar/isar.dart';

part 'cache_model.g.dart';

@collection
class CacheModel {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  String? key;
  String? value;
}
