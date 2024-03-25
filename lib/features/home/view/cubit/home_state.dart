part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loadingAutocomplete() = _LoadingAutocomplete;
  const factory HomeState.autocompleteLoaded(List<String> terms) =
      _AutocompleteLoaded;
  const factory HomeState.autocompleteError() = _AutocompleteError;

  const factory HomeState.loadingSearch() = _LoadingSearch;
  const factory HomeState.searchLoaded(List<Bussiness> bussiness) =
      _SearchLoaded;
  const factory HomeState.searchError() = _SearchError;

  const factory HomeState.wheelSpinned(bool spinned) = _WheelSpinned;
  const factory HomeState.markersUpdated(List<Bussiness> bussinesses) =
      _MarkersUpdated;
}
