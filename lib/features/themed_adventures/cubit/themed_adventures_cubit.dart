import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'themed_adventures_state.dart';
part 'themed_adventures_cubit.freezed.dart';

class ThemedAdventuresCubit extends Cubit<ThemedAdventuresState> {
  ThemedAdventuresCubit() : super(const ThemedAdventuresState.initial());
}
