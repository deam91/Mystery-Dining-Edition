import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:mystery_dining_edition/common/enums.dart';
import 'package:mystery_dining_edition/features/home/view/cubit/home_cubit.dart';
import 'package:rxdart/rxdart.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class WheelActionButton extends StatefulWidget {
  const WheelActionButton({
    super.key,
  });

  @override
  State<WheelActionButton> createState() => _WheelActionButtonState();
}

class _WheelActionButtonState extends State<WheelActionButton> {
  final pageIndexNotifier = ValueNotifier(0);

  @override
  void dispose() {
    super.dispose();
  }

  NonScrollingWoltModalSheetPage _getWheelPage(
    BuildContext context,
    HomeCubit cubit,
  ) {
    final controller = BehaviorSubject<int>();

    return NonScrollingWoltModalSheetPage(
      hasTopBarLayer: true,
      topBarTitle: Text(
        'Spin the wheel!',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Drag the wheel to spin',
              textAlign: TextAlign.center,
            ),
            Flexible(
              flex: 2,
              child: FortuneWheel(
                animateFirst: false,
                onFling: () {
                  final rdm = Random().nextInt(CuisineTypes.values.length);
                  controller.add(rdm + 1);
                },
                onAnimationEnd: () async {
                  print('onAnimationEnd');
                  final index = controller.stream.value - 1;
                  cubit.wheelResult = CuisineTypes.values[index].name;
                  pageIndexNotifier.value = pageIndexNotifier.value + 1;
                },
                selected: controller.stream,
                items: CuisineTypes.values
                    .map((e) => FortuneItem(child: Text(e.name)))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
      trailingNavBarWidget: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          Navigator.of(context).pop();
          pageIndexNotifier.value = 0;
        },
      ),
    );
  }

  WoltModalSheetPage _getLoadingPage(
    BuildContext context,
    HomeCubit cubit,
  ) {
    return WoltModalSheetPage(
      isTopBarLayerAlwaysVisible: true,
      topBarTitle: Text(
        'Culinary Roulette',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircularProgressIndicator(
              strokeWidth: .5,
            ),
            SizedBox(
              height: 80,
              child: Center(
                child: AnimatedTextKit(
                  isRepeatingAnimation: false,
                  animatedTexts: [
                    RotateAnimatedText(
                      'Spinning the Wheel of Flavor...',
                      textAlign: TextAlign.center,
                    ),
                    RotateAnimatedText(
                      'Anticipating Your \nGastronomic Surprise...',
                      rotateOut: false,
                      textAlign: TextAlign.center,
                    ),
                  ],
                  onFinished: () async {
                    final wheelResult = cubit.wheelResult;
                    final resp =
                        await cubit.getMysterySuggestion(cuisine: wheelResult);
                    if (context.mounted && !resp) {
                      pageIndexNotifier.value = 0;
                      Navigator.of(context).pop();
                    } else {
                      pageIndexNotifier.value = pageIndexNotifier.value + 1;
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      hasSabGradient: false,
      trailingNavBarWidget: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          Navigator.of(context).pop();
          pageIndexNotifier.value = 0;
        },
      ),
    );
  }

  SliverWoltModalSheetPage _getResultPage(
    BuildContext context,
    HomeCubit cubit,
  ) {
    return SliverWoltModalSheetPage(
      pageTitle: Text(
        'Wheel Results',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      mainContentSlivers: [
        BlocBuilder<HomeCubit, HomeState>(
          bloc: cubit,
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            final bussiness = state.whenOrNull(
                  searchLoaded: (bussiness) => bussiness,
                ) ??
                [];
            print('BUSSINESS: ${bussiness.length}');
            return SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final bussinessItem = bussiness[index];
                    return ListTile(
                      trailing: IconButton(
                        icon: const Icon(Icons.arrow_forward_ios),
                        onPressed: () {
                          context.push('/details', extra: bussinessItem);
                        },
                      ),
                      leading: bussinessItem.imageUrl != null
                          ? Hero(
                              tag: Key(bussinessItem.id ?? ''),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  width: 100,
                                  height: 100,
                                  imageUrl: bussinessItem.imageUrl ?? '',
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  errorWidget: (context, url, error) {
                                    return const Icon(Icons.error);
                                  },
                                ),
                              ),
                            )
                          : const Icon(Icons.error),
                      title: Text(bussinessItem.name ?? 'No Name'),
                      subtitle: Wrap(
                        spacing: 2,
                        runSpacing: 2,
                        children: [
                          if (bussinessItem.rating != null)
                            Chip(
                              shape: const StadiumBorder(),
                              labelPadding: const EdgeInsets.only(right: 5),
                              padding: const EdgeInsets.all(2),
                              avatar: const Icon(Icons.star, size: 20),
                              label: Text(bussinessItem.rating.toString()),
                            ),
                          if (bussinessItem.reviewCount != null)
                            Chip(
                              shape: const StadiumBorder(),
                              labelPadding: const EdgeInsets.only(right: 5),
                              padding: const EdgeInsets.all(2),
                              avatar:
                                  const Icon(Icons.reviews_rounded, size: 20),
                              label: Text(bussinessItem.reviewCount.toString()),
                            ),
                          if (bussinessItem.url != null)
                            const Chip(
                              shape: StadiumBorder(),
                              labelPadding: EdgeInsets.only(right: 5),
                              padding: EdgeInsets.all(2),
                              avatar: Icon(Icons.link, size: 20),
                              label: Text('See on Yelp'),
                            ),
                        ],
                      ),
                    );
                  },
                  childCount: bussiness.length,
                ),
              ),
            );
          },
        ),
      ],
      trailingNavBarWidget: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          Navigator.of(context).pop();
          pageIndexNotifier.value = 0;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        final bloc = context.read<HomeCubit>();
        WoltModalSheet.show(
          context: context,
          pageIndexNotifier: pageIndexNotifier,
          barrierDismissible: false,
          useRootNavigator: false,
          decorator: (child) {
            return BlocProvider<HomeCubit>.value(
              value: bloc,
              child: child,
            );
          },
          pageListBuilder: (context) {
            return [
              _getWheelPage(context, bloc),
              _getLoadingPage(context, bloc),
              _getResultPage(context, bloc),
            ];
          },
          modalTypeBuilder: (context) {
            return WoltModalType.dialog;
          },
          onModalDismissedWithBarrierTap: () {
            pageIndexNotifier.value = 0;
          },
          maxDialogWidth: 560,
          minDialogWidth: 400,
          minPageHeight: 0,
          maxPageHeight: 0.9,
        );
      },
      shape: const CircleBorder(),
      tooltip: 'Culinary Roulette',
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Lottie.asset('assets/roulette.json', repeat: false),
    );
  }
}
