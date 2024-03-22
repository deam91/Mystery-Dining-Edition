import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mystery_dining_edition/features/roulette/roulette.dart';

class RoulettePage extends StatelessWidget {
  const RoulettePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RouletteCubit(),
      child: const RouletteView(),
    );
  }
}

class RouletteView extends StatelessWidget {
  const RouletteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RouletteCubit, RouletteState>(
      builder: (context, state) {
        // TODO: return correct widget based on the state.
        return const SizedBox();
      },
    );
  }
}
