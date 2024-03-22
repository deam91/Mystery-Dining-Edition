import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'roulette_state.dart';
part 'roulette_cubit.freezed.dart';

class RouletteCubit extends Cubit<RouletteState> {
  RouletteCubit() : super(const RouletteState.initial());
}
