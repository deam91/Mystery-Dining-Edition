import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:location/location.dart' as loc;
import 'package:location/location.dart' as ps show PermissionStatus;
import 'package:mystery_dining_edition/common/enums.dart';
import 'package:mystery_dining_edition/common/functions.dart';
import 'package:mystery_dining_edition/common/locator.dart';
import 'package:mystery_dining_edition/common/models/bussiness/bussiness.dart';
import 'package:mystery_dining_edition/common/models/user_preferences.dart';
import 'package:permission_handler/permission_handler.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.initial()) {
    serviceLocator.cacheService.startListener();
    cacheSubscription =
        serviceLocator.cacheService.bussinessStream.listen((value) {
      print('RECEIVED CACHE STREAM: ${value.length}');
      if (value.isNotEmpty) {
        markers = value;
        emit(HomeState.markersUpdated(markers ?? []));
      }
    });
  }

  double turns = 0;
  double prevValue = 0;
  bool get locationPermissionGranted => _locationPermissionGranted;
  bool _locationPermissionGranted = false;
  bool disabled = false;
  bool initialMapLoading = false;

  UserPreferencesModel? userPreferences;

  String wheelResult = '';

  loc.Location location = loc.Location();
  List<Bussiness>? bussiness;
  List<Bussiness>? markers;

  StreamSubscription<loc.LocationData>? locationSubs;

  ValueNotifier<loc.LocationData?> locationNotifier =
      ValueNotifier<loc.LocationData?>(null);
  ValueNotifier<double> compassNotifier = ValueNotifier<double>(0);

  StreamSubscription? cacheSubscription;

  Future<void> autocomplete({
    required String text,
    double? latitude,
    double? longitude,
    String? locale,
  }) async {
    try {
      emit(const HomeState.loadingAutocomplete());
      final resp = await serviceLocator.homeService.autocomplete(
        text: text,
        locale: AppLocale.en_US.name, // TODO: get it from user onboarding info
        latitude: latitude,
        longitude: longitude,
      );
      emit(HomeState.autocompleteLoaded(resp));
    } on Exception {
      emit(const HomeState.autocompleteError());
    }
  }

  int getRandomInt(int max) {
    return Random.secure().nextInt(max);
  }

  Future<bool> getMysterySuggestion({
    int limit = 20,
    String cuisine = '',
  }) async {
    final coordenates = locationNotifier.value;
    final attributes = userPreferences?.selectedCategories
            .map((e) => e.displayName.toLowerCase())
            .toList() ??
        [];
    final location = userPreferences?.selectedLocale?.country ?? '';
    final locale = userPreferences?.selectedLocale?.code;
    final termsLength = userPreferences?.selectedCousines.length;
    final randomIndex = termsLength != null ? getRandomInt(termsLength) : 0;
    final term = cuisine.isNotEmpty
        ? cuisine
        : userPreferences?.selectedCousines[randomIndex];
    try {
      emit(const HomeState.loadingSearch());
      if (coordenates?.latitude != null && coordenates?.longitude != null) {
        bussiness = await serviceLocator.homeService.getMysterySuggestion(
          latitude: coordenates!.latitude,
          longitude: coordenates.longitude,
          locale: locale,
          term: term,
          categories: attributes,
          limit: limit,
        );
      } else {
        bussiness = await serviceLocator.homeService.getMysterySuggestion(
          location: location.isNotEmpty ? location : 'US',
          locale: locale,
          term: term,
          categories: attributes,
          limit: limit,
        );
      }
      if (bussiness == null) {
        emit(const HomeState.searchError());
        return false;
      }
      final result = limit == 1 ? [bussiness!.first] : bussiness!;
      emit(HomeState.searchLoaded(result));
      return true;
    } on Exception {
      emit(const HomeState.searchError());
      return false;
    }
  }

  Future<bool> isServiceEnabled() async {
    return location.serviceEnabled();
  }

  Future<bool> enableService() async {
    return location.requestService();
  }

  Future<PermissionStatus> isLocationPermissionDisabled() async {
    if (await Permission.location.isDenied ||
        await Permission.location.isRestricted) return PermissionStatus.denied;
    if (await Permission.location.isPermanentlyDenied) {
      return PermissionStatus.permanentlyDenied;
    }
    return PermissionStatus.granted;
  }

  Future<bool> requestLocationPermissions() async {
    final status = await Permission.location.request();
    return status == PermissionStatus.granted;
  }

  Future<void> _loadLocation() async {
    await location.changeSettings(interval: 5000, distanceFilter: 5);
    locationNotifier.value = await location.getLocation();
  }

  Future<bool> checkLocation({bool showSettings = false}) async {
    safePrint('checkLocation');
    final enabled = await isServiceEnabled();
    safePrint('enabled $enabled');
    if (!enabled) {
      _locationPermissionGranted = false;
      if (showSettings) {
        final result = await enableService();
        if (!result) {
          _locationPermissionGranted = result;
          return result;
        }
      }
      safePrint('1_locationPermissionGranted $_locationPermissionGranted');
      return false;
    }
    //
    if (!await Permission.location.request().isGranted) {
      final isPermanentlyDenied = await Permission.location.isPermanentlyDenied;
      final isDenied = await Permission.location.isDenied;
      safePrint('isPermanentlyDenied $isPermanentlyDenied');
      safePrint('isDenied $isDenied');
      if (isDenied) {
        final status = await location.requestPermission();
        if (status == ps.PermissionStatus.grantedLimited ||
            status == ps.PermissionStatus.granted) {
          _locationPermissionGranted = true;
          _loadLocation();
          _subscribeToLocationChanges();
          return true;
        }
      } else if ((isDenied || isPermanentlyDenied) && showSettings) {
        await openAppSettings();
      }
      _locationPermissionGranted = false;
      safePrint('2_locationPermissionGranted $_locationPermissionGranted');
      return false;
    }
    //
    safePrint('3_locationPermissionGranted $_locationPermissionGranted');
    _locationPermissionGranted = true;
    _loadLocation();
    _subscribeToLocationChanges();
    return true;
  }

  void _subscribeToLocationChanges() {
    locationSubs ??=
        location.onLocationChanged.listen((loc.LocationData currentLocation) {
      safePrint('currentLocation: $currentLocation');
      locationNotifier.value = currentLocation;
    });
  }

  @override
  Future<void> close() {
    locationSubs?.cancel();
    return super.close();
  }

  UserPreferencesModel getUserPreferences() {
    return userPreferences = serviceLocator.cacheService.userPreferences;
  }
}
