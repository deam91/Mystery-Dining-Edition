import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mystery_dining_edition/common/locator.dart';
import 'package:mystery_dining_edition/common/models/bussiness/bussiness.dart';
import 'package:mystery_dining_edition/common/routes/observer.dart';
import 'package:mystery_dining_edition/common/views/scaffold_navbar.dart';
import 'package:mystery_dining_edition/features/adventure/adventure.dart';
import 'package:mystery_dining_edition/features/home/home.dart';
import 'package:mystery_dining_edition/features/onboarding/view/onboarding_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  observers: [GoRouterObserver()],
  debugLogDiagnostics: true,
  initialLocation: '/home',
  redirect: (context, state) {
    final url = state.uri.path;
    if (url == '/home') {
      final watched = serviceLocator.cacheService.isOnboardingWatched;
      print('PATH: $url, ONBOARDING WATCHED: $watched');
      // test onboarding here
      if (!watched) {
        return '/onboarding';
      }
    }
    return null;
  },
  routes: [
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/onboarding',
      builder: (context, state) => const OnboardingPage(),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return ScaffoldWithNavBar(child: child);
      },
      routes: [
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/home',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/adventures',
          builder: (context, state) => const AdventurePage(),
        ),
      ],
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/details',
      builder: (context, state) {
        final model = state.extra! as Bussiness;
        return BussinessDetailsPage(
          bussiness: model,
        );
      },
    ),
  ],
);
