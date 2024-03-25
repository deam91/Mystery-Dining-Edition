import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_map_cache/flutter_map_cache.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:mystery_dining_edition/common/functions.dart';

import 'package:mystery_dining_edition/features/home/home.dart';
import 'package:mystery_dining_edition/features/home/view/widgets/wheel_action_button.dart';
import 'package:mystery_dining_edition/features/home/view/widgets/mystery_search_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: const HomeView(),
    );
  }
}

extension LatLong on LocationData {
  LatLng latlong() {
    return LatLng(latitude!, longitude!);
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final accessToken = dotenv.env['MAPBOX_TOKEN'];
  final tileSetId = 'clu2vz9na00nt01mjgdl03o5w';
  final accountName = 'deam27';
  // List<Marker> markers = [];
  LatLng? me;

  String? pathFuture;

  late final _animatedMapController = AnimatedMapController(vsync: this);

  void _locationListener() {
    final state = context.read<HomeCubit>().locationNotifier.value;
    safePrint('Location Data Changed: $state');
    if (state != null) {
      _animatedMapController.centerOnPoint(state.latlong(), zoom: 13);
      setState(() {
        me = state.latlong();
      });
    }
  }

  Future<void> _onMapCreated() async {
    safePrint('_onMapCreated');
    final resp =
        await context.read<HomeCubit>().checkLocation(showSettings: true);
    print('resp $resp');
    context.read<HomeCubit>().locationNotifier.addListener(_locationListener);
  }

  @override
  void dispose() {
    // context
    //     .read<HomeCubit>()
    //     .locationNotifier
    //     .removeListener(_locationListener);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getPath().then(
      (value) => setState(() {
        pathFuture = value;
      }),
    );
    context.read<HomeCubit>().getUserPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Stack(
          children: [
            FlutterMap(
              mapController: _animatedMapController.mapController,
              options: MapOptions(
                minZoom: 4,
                maxZoom: 22,
                initialZoom: 6,
                keepAlive: true,
                // initialCenter: ,
                onMapReady: _onMapCreated,
                interactionOptions: const InteractionOptions(
                  flags: InteractiveFlag.pinchZoom | InteractiveFlag.drag,
                ),
                backgroundColor: Theme.of(context).colorScheme.background,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://api.mapbox.com/styles/v1/$accountName/$tileSetId/tiles/256/{z}/{x}/{y}@2x?access_token=$accessToken',
                  tileProvider: CachedTileProvider(
                    // maxStale keeps the tile cached for the given Duration and
                    // tries to revalidate the next time it gets requested
                    maxStale: const Duration(days: 30),
                    store: HiveCacheStore(
                      pathFuture,
                      hiveBoxName: 'ruvikMap',
                    ),
                  ),
                ),
                AnimatedMarkerLayer(
                  markers: [
                    if (me != null)
                      AnimatedMarker(
                        point: me!,
                        builder: (_, animation) {
                          return Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                            width: 10 * animation.value,
                            height: 10 * animation.value,
                          );
                        },
                      ),
                  ],
                ),
                state.maybeWhen(
                  markersUpdated: (bussinesses) {
                    return AnimatedMarkerLayer(
                      markers: bussinesses
                          .map(
                            (e) => AnimatedMarker(
                              point: LatLng(
                                e.coordinates!.latitude!,
                                e.coordinates!.longitude!,
                              ),
                              builder: (_, animation) {
                                return GestureDetector(
                                  onTap: () {
                                    context.push('/details', extra: e);
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.green,
                                    backgroundImage: CachedNetworkImageProvider(
                                      e.imageUrl!,
                                      maxWidth: 30,
                                      maxHeight: 30,
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                          .toList(),
                    );
                  },
                  orElse: () => const SizedBox.shrink(),
                ),
              ],
            ),
            const Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: MysterySearchButton(),
              ),
            ),
            const Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: WheelActionButton(),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
