import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:mystery_dining_edition/common/cache/cache_service.dart';
import 'package:mystery_dining_edition/common/http/api_provider.dart';
import 'package:mystery_dining_edition/features/home/model/repositories/home_repository.dart';
import 'package:mystery_dining_edition/features/home/service/home_service.dart';

final serviceLocator = GetIt.instance;

Future<void> registerServiceLocator() async {
  if (kDebugMode) {
    print('setup singletons...');
  }
  final apiProvider = ApiProvider();
  final cacheService = CacheService();
  await cacheService.initialize();
  serviceLocator
    ..registerSingleton(apiProvider)
    ..registerSingleton(cacheService)
    ..registerSingleton(
      HomeService(
        repository: HomeRepository(apiProvider: apiProvider),
      ),
    );
}

extension Getters on GetIt {
  HomeService get homeService => get<HomeService>();
  CacheService get cacheService => get<CacheService>();
}
