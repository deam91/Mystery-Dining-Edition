import 'package:bloc/bloc.dart';
import 'package:mystery_dining_edition/common/enums.dart';
import 'package:mystery_dining_edition/common/locator.dart';
import 'package:mystery_dining_edition/common/models/user_preferences.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingState());

  void saveUserPreferences({
    required List<String> selectedCousines,
    required List<CategoryTypes> selectedCategories,
    required LocaleInfo? selectedLocale,
  }) {
    final model = UserPreferencesModel(
      selectedCousines,
      selectedCategories,
      selectedLocale,
    );
    serviceLocator.cacheService.setUserPreferences(model);
  }
}
