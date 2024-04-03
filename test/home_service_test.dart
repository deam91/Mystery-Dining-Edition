import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mystery_dining_edition/common/http/api_provider.dart';
import 'package:mystery_dining_edition/common/models/bussiness/bussiness.dart';
import 'package:mystery_dining_edition/features/home/model/data/autocomplete.request.dart';
import 'package:mystery_dining_edition/features/home/model/data/bussiness.req.dart';
import 'package:mystery_dining_edition/features/home/model/data/bussiness.res.dart';
import 'package:mystery_dining_edition/features/home/model/repositories/home_repository.dart';
import 'package:mystery_dining_edition/features/home/service/home_service.dart';

// Setup dio instance and adapter used to mock requests
(Dio, DioAdapter) setupDio() {
  dotenv.testLoad(fileInput: File('./assets/env/.env').readAsStringSync());
  final dio = Dio(BaseOptions());
  final adapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  return (dio, adapter);
}

void main() {
  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
  });

  group('Home Service', () {
    test('call to autocomplete return results', () async {
      const model = AutocompleteRequestModel(
        text: 'NY',
      );
      final (dio, adapter) = setupDio();
      adapter.onGet(
        RegExp('.*'),
        (server) => server.reply(
          200,
          {
            'terms': [
              {'text': 'New York'},
              {'text': 'New Jersey'},
            ],
          },
        ),
        queryParameters: model.toJson(),
      );

      final service = HomeService(
        repository: HomeRepository(
          apiProvider: ApiProvider(dio: dio),
        ),
      );
      final result = await service.autocomplete(text: 'NY');
      expect(result, isNotNull);
      expect(result.length, equals(2));
    });

    test('get one mystery suggestion', () async {
      const model = BussinessReqModel(
        location: 'NY',
        term: 'restaurants',
        limit: 1,
        offset: 0,
      );
      final (dio, adapter) = setupDio();

      final result = BussinessResModel(businesses: [Bussiness.empty()]);
      adapter.onGet(
        RegExp('.*'),
        (server) => server.reply(
          200,
          result.toJson(),
        ),
        queryParameters: model.toJson(),
      );

      final service = HomeService(
        repository: HomeRepository(
          apiProvider: ApiProvider(dio: dio),
        ),
      );
      final response = await service.getMysterySuggestion(
        location: 'NY',
        term: 'restaurants',
        offset: 0,
      );
      expect(response, isNotNull);
      expect(response?.length, equals(1));
    });

    test('get multiple mystery suggestions', () async {
      const model = BussinessReqModel(
        location: 'NY',
        term: 'restaurants',
        limit: 10,
        offset: 0,
      );
      final (dio, adapter) = setupDio();

      final result = BussinessResModel(
        businesses: List.generate(
          10,
          (index) => Bussiness.empty(),
        ),
      );
      adapter.onGet(
        RegExp('.*'),
        (server) => server.reply(
          200,
          result.toJson(),
        ),
        queryParameters: model.toJson(),
      );

      final service = HomeService(
        repository: HomeRepository(
          apiProvider: ApiProvider(dio: dio),
        ),
      );
      final response = await service.getMysterySuggestion(
        location: 'NY',
        term: 'restaurants',
        offset: 0,
      );
      expect(response, isNotNull);
      expect(response?.length, equals(10));
    });
  });
}
