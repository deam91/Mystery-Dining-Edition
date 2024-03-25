import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:mystery_dining_edition/common/locator.dart';
import 'package:mystery_dining_edition/common/models/bussiness/bussiness.dart';
import 'package:mystery_dining_edition/features/home/view/cubit/home_cubit.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class MysterySearchButton extends StatefulWidget {
  const MysterySearchButton({super.key});

  @override
  State<MysterySearchButton> createState() => _MysterySearchButtonState();
}

class _MysterySearchButtonState extends State<MysterySearchButton> {
  bool loading = false;
  List<String> terms = [];

  late final FloatingSearchBarController controller;

  final pageIndexNotifier = ValueNotifier(0);

  @override
  void initState() {
    controller = FloatingSearchBarController();
    super.initState();
  }

  WoltModalSheetPage _getMysteryLoadingPage(
    BuildContext context,
  ) {
    return WoltModalSheetPage(
      isTopBarLayerAlwaysVisible: true,
      topBarTitle: Text(
        'Mystery Search',
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
                      'Preparing Your \nGastronomic Adventure...',
                      textAlign: TextAlign.center,
                    ),
                    RotateAnimatedText(
                      'Unveiling \nHidden Delights...',
                      textAlign: TextAlign.center,
                    ),
                    RotateAnimatedText(
                      'Get Ready \nfor a Tantalizing Experience...',
                      textAlign: TextAlign.center,
                      rotateOut: false,
                    ),
                  ],
                  onFinished: () async {
                    final resp = await context
                        .read<HomeCubit>()
                        .getMysterySuggestion(limit: 1);
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

  WoltModalSheetPage _getMysteryResultPage(
    BuildContext context,
  ) {
    return WoltModalSheetPage(
      isTopBarLayerAlwaysVisible: true,
      topBarTitle: Text(
        'Mystery Search',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final bussiness =
                context.read<HomeCubit>().bussiness?.first ?? Bussiness.empty();
            // if (context.read<HomeCubit>().bussiness?.first != null) {
            //   serviceLocator.cacheService.saveUserBussiness(bussiness);
            // }
            return Column(
              children: [
                Text(
                  bussiness.name ?? 'Mystery Search',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                if (bussiness.imageUrl != null &&
                    bussiness.imageUrl!.isNotEmpty)
                  Hero(
                    tag: Key(bussiness.id ?? ''),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl: bussiness.imageUrl ?? '',
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) {
                            print(url);
                            print(error);
                            return const Icon(Icons.error);
                          },
                        ),
                      ),
                    ),
                  ),
                Wrap(
                  spacing: 5,
                  children: [
                    if (bussiness.rating != null)
                      Chip(
                        shape: const StadiumBorder(),
                        avatar: const Icon(Icons.star),
                        label: Text(bussiness.rating.toString()),
                      ),
                    if (bussiness.reviewCount != null)
                      Chip(
                        shape: const StadiumBorder(),
                        avatar: const Icon(Icons.reviews_rounded),
                        label: Text(bussiness.reviewCount.toString()),
                      ),
                    if (bussiness.url != null)
                      const Chip(
                        shape: StadiumBorder(),
                        avatar: Icon(Icons.link),
                        label: Text('See on Yelp'),
                      ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    context.push('/details', extra: bussiness);
                  },
                  child: const Text('Details'),
                ),
              ],
            );
          },
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

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        state.whenOrNull(
          loadingAutocomplete: () => setState(() {
            loading = true;
          }),
          autocompleteLoaded: (values) => setState(() {
            loading = false;
            terms = values;
          }),
          autocompleteError: () => setState(() {
            loading = false;
          }),
        );
      },
      builder: (context, state) {
        return SafeArea(
          child: FilledButton.icon(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.background,
              foregroundColor: Colors.white,
            ),
            // padding: const EdgeInsets.all(2),
            icon: const Icon(Icons.search_rounded),
            label: const Text('Mystery Search'),
            onPressed: () {
              final bloc = context.read<HomeCubit>();
              WoltModalSheet.show(
                context: context,
                pageIndexNotifier: pageIndexNotifier,
                barrierDismissible: false,
                useRootNavigator: false,
                decorator: (child) {
                  return BlocProvider.value(value: bloc, child: child);
                },
                pageListBuilder: (context) {
                  return [
                    _getMysteryLoadingPage(context),
                    _getMysteryResultPage(context),
                  ];
                },
                modalTypeBuilder: (context) {
                  return WoltModalType.dialog;
                },
                onModalDismissedWithBarrierTap: () {
                  pageIndexNotifier.value = 0;
                },
              );
            },
          ),
        );
      },
    );
  }
}
