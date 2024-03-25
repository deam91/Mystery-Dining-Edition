import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:isar/isar.dart';
import 'package:mystery_dining_edition/common/models/bussiness/bussiness.dart';
import 'package:mystery_dining_edition/common/models/cache_model.dart';
import 'package:mystery_dining_edition/common/models/user_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';

class CacheService {
  CacheService();
  Box<bool>? appUserBox;
  Box? userPreferencesBox;
  Isar? isar;

  ReplaySubject<List<Bussiness>> bussinessStream =
      ReplaySubject<List<Bussiness>>();

  Future<void> initialize() async {
    Hive.registerAdapter(UserPreferencesModelAdapter());
    appUserBox = await Hive.openBox('appUserBox');
    userPreferencesBox = await Hive.openBox('userPreferencesModel');

    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [CacheModelSchema],
      directory: dir.path,
    );
  }

  Future<void> put({required String key, required bool value}) async {
    await appUserBox?.put(key, value);
  }

  bool get({required String key}) {
    return appUserBox?.get(key) ?? false;
  }

  Future<void> putUserPreferences({
    required String key,
    required String value,
  }) async {
    await userPreferencesBox?.put(key, value);
  }

  String _getUserPreferences({required String key}) {
    return userPreferencesBox?.get(key) as String;
  }

  bool get isOnboardingWatched => get(key: 'onboardingWatched');
  Future<void> setOnboardingWatched(bool watched) async =>
      put(key: 'onboardingWatched', value: watched);

  UserPreferencesModel get userPreferences {
    final source = _getUserPreferences(key: 'userPreferences');
    return UserPreferencesModel.fromJson(source);
  }

  Future<void> setUserPreferences(
    UserPreferencesModel userPreferencesModel,
  ) async =>
      putUserPreferences(
        key: 'userPreferences',
        value: userPreferencesModel.toJson(),
      );

  Future<void> saveUserBussiness(Bussiness bussiness) async {
    final newEmail = CacheModel()
      ..key = bussiness.id
      ..value = json.encode(bussiness.toJson());

    await isar?.writeTxn(() async {
      await isar?.cacheModels.put(newEmail);
    });
  }

  Stream<List<CacheModel>> listen() {
    return isar!.cacheModels
        .where()
        .distinctByKey()
        .watch(fireImmediately: true);
  }

  void startListener() {
    bussinessStream.close();
    bussinessStream = ReplaySubject();
    listen().listen((event) {
      if (event.isNotEmpty) {
        final model = event
            .map(
              (e) => Bussiness.fromJson(
                json.decode(e.value!) as Map<String, dynamic>,
              ),
            )
            .toList();
        bussinessStream.sink.add(model);
      }
    });
  }

  Future<List<Bussiness>?> getUserBussiness() async {
    final bussiness = await isar?.cacheModels.where().distinctByKey().findAll();
    return bussiness
        ?.map(
          (e) =>
              Bussiness.fromJson(json.decode(e.value!) as Map<String, dynamic>),
        )
        .toList();
  }
}
