import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:mystery_dining_edition/features/adventure/adventure.dart';

class AdventurePage extends StatelessWidget {
  const AdventurePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AdventureCubit(),
      child: const AdventureView(),
    );
  }
}

class AdventureView extends StatefulWidget {
  const AdventureView({super.key});

  @override
  State<AdventureView> createState() => _AdventureViewState();
}

class _AdventureViewState extends State<AdventureView> {
  Future? _future;

  @override
  void initState() {
    super.initState();
    context.read<AdventureCubit>().getUserBussinesses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text('Your Adventures'),
      ),
      body: BlocBuilder<AdventureCubit, AdventureState>(
        builder: (context, state) {
          return state.when(
            initial: () {
              return const Center(
                child: CircularProgressIndicator(
                  strokeWidth: .5,
                ),
              );
            },
            loading: () {
              return const Center(
                child: CircularProgressIndicator(
                  strokeWidth: .5,
                ),
              );
            },
            loaded: (bussiness) {
              if (bussiness != null && bussiness.isNotEmpty) {
                return CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.all(20),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final bussinessItem = bussiness[index];
                            return ListTile(
                              trailing: IconButton(
                                icon: const Icon(Icons.arrow_forward_ios),
                                onPressed: () {
                                  context.push(
                                    '/details',
                                    extra: bussinessItem,
                                  );
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
                                          imageUrl:
                                              bussinessItem.imageUrl ?? '',
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) =>
                                              const Center(
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
                                      labelPadding:
                                          const EdgeInsets.only(right: 5),
                                      padding: const EdgeInsets.all(2),
                                      avatar: const Icon(Icons.star, size: 20),
                                      label:
                                          Text(bussinessItem.rating.toString()),
                                    ),
                                  if (bussinessItem.reviewCount != null)
                                    Chip(
                                      shape: const StadiumBorder(),
                                      labelPadding:
                                          const EdgeInsets.only(right: 5),
                                      padding: const EdgeInsets.all(2),
                                      avatar: const Icon(
                                        Icons.reviews_rounded,
                                        size: 20,
                                      ),
                                      label: Text(
                                        bussinessItem.reviewCount.toString(),
                                      ),
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
                    ),
                  ],
                );
              }
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error),
                    Text('No restaurants logs found'),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
