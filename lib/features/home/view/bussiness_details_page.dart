import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mystery_dining_edition/common/locator.dart';
import 'package:mystery_dining_edition/common/models/bussiness/bussiness.dart';
import 'package:url_launcher/url_launcher.dart';

class BussinessDetailsPage extends StatefulWidget {
  const BussinessDetailsPage({required this.bussiness, super.key});

  final Bussiness bussiness;

  @override
  State<BussinessDetailsPage> createState() => _BussinessDetailsPageState();
}

class _BussinessDetailsPageState extends State<BussinessDetailsPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.bussiness != Bussiness.empty()) {
      serviceLocator.cacheService.saveUserBussiness(widget.bussiness);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(widget.bussiness.name ?? ''),
      ),
      body: Column(
        children: [
          Hero(
            tag: Key(widget.bussiness.id ?? ''),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: CachedNetworkImage(
                imageUrl: widget.bussiness.imageUrl ?? '',
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: .5,
                  ),
                ),
                errorWidget: (context, url, error) {
                  print(url);
                  print(error);
                  return const Icon(Icons.error);
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            children: [
              if (widget.bussiness.rating != null)
                Chip(
                  shape: const StadiumBorder(),
                  avatar: const Icon(Icons.star),
                  label: Text(widget.bussiness.rating.toString()),
                ),
              if (widget.bussiness.reviewCount != null)
                Chip(
                  shape: const StadiumBorder(),
                  avatar: const Icon(Icons.reviews_rounded),
                  label: Text(widget.bussiness.reviewCount.toString()),
                ),
              if (widget.bussiness.url != null)
                GestureDetector(
                  onTap: () {
                    _launchUrl(widget.bussiness.url!);
                  },
                  child: const Chip(
                    shape: StadiumBorder(),
                    avatar: Icon(Icons.link),
                    label: Text('See on Yelp'),
                  ),
                ),
              if (widget.bussiness.phone != null)
                Chip(
                  shape: const StadiumBorder(),
                  avatar: const Icon(Icons.phone),
                  label: Text(widget.bussiness.phone!),
                ),
              if (widget.bussiness.distance != null)
                Chip(
                  shape: const StadiumBorder(),
                  avatar: const Icon(Icons.route),
                  label: Text(_getDistance(widget.bussiness.distance!)),
                ),
              if (widget.bussiness.attributes?.menuUrl != null)
                GestureDetector(
                  onTap: () {
                    _launchUrl(widget.bussiness.attributes!.menuUrl!);
                  },
                  child: const Chip(
                    shape: StadiumBorder(),
                    avatar: Icon(Icons.menu_book),
                    label: Text('Menu'),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  String _getDistance(double meters) {
    final distanceInKiloMeters = meters / 1000;
    final roundDistanceInKM =
        double.parse(distanceInKiloMeters.toStringAsFixed(2));
    return '$roundDistanceInKM km';
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      return;
    }
  }
}
