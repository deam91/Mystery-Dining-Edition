part of 'adventure_cubit.dart';

@freezed
class AdventureState with _$AdventureState {
  const factory AdventureState.initial() = _Initial;
  const factory AdventureState.loading() = _Loading;
  const factory AdventureState.loaded(List<Bussiness>? bussinesses) = _Loaded;
}
