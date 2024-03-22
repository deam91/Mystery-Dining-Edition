import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mystery_dining_edition/features/themed_adventures/themed_adventures.dart';

class ThemedAdventuresPage extends StatelessWidget {
  const ThemedAdventuresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemedAdventuresCubit(),
      child: const ThemedAdventuresView(),
    );
  }
}

class ThemedAdventuresView extends StatelessWidget {
  const ThemedAdventuresView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemedAdventuresCubit, ThemedAdventuresState>(
      builder: (context, state) {
        // TODO: return correct widget based on the state.
        return const SizedBox();
      },
    );
  }
}
