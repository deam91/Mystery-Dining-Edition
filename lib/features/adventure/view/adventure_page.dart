import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

class AdventureView extends StatelessWidget {
  const AdventureView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdventureCubit, AdventureState>(
      builder: (context, state) {
        // TODO: return correct widget based on the state.
        return const SizedBox();
      },
    );
  }
}
