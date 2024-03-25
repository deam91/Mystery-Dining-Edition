import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mystery_dining_edition/common/locator.dart';
import 'package:mystery_dining_edition/common/models/bussiness/bussiness.dart';

part 'adventure_state.dart';
part 'adventure_cubit.freezed.dart';

class AdventureCubit extends Cubit<AdventureState> {
  AdventureCubit() : super(const AdventureState.initial());

  List<Bussiness>? bussinesses;

  Future<void> getUserBussinesses() async {
    emit(const AdventureState.loading());
    bussinesses = await serviceLocator.cacheService.getUserBussiness();
    emit(AdventureState.loaded(bussinesses));
    return;
  }
}
