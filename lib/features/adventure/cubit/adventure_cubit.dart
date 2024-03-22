import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'adventure_state.dart';
part 'adventure_cubit.freezed.dart';

class AdventureCubit extends Cubit<AdventureState> {
  AdventureCubit() : super(const AdventureState.initial());
}
