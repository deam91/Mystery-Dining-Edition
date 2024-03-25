import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

void safePrint(dynamic value) {
  if (kDebugMode) {
    print(value);
  }
}

Future<String> getPath() async {
  final cacheDirectory = await getTemporaryDirectory();
  return cacheDirectory.path;
}
