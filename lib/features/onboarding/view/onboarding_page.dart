import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:mystery_dining_edition/common/enums.dart';
import 'package:mystery_dining_edition/common/locator.dart';

import 'package:mystery_dining_edition/features/onboarding/onboarding.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: const OnboardingView(),
    );
  }
}

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  List<String> selectedCousines = [];
  List<CategoryTypes> selectedCategories = [];
  LocaleInfo? selectedLocale;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          return IntroSlider(
            onDonePress: () async {
              await serviceLocator.cacheService.setOnboardingWatched(true);
              if (context.mounted) {
                context.read<OnboardingCubit>().saveUserPreferences(
                      selectedCategories: selectedCategories,
                      selectedCousines: selectedCousines,
                      selectedLocale: selectedLocale,
                    );
                context.go('/home');
              }
            },
            isScrollable: false,
            isShowSkipBtn: false,
            listContentConfig: [
              ContentConfig(
                widgetTitle: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/icon/logo.png',
                      scale: .6,
                      fit: BoxFit.scaleDown,
                    ),
                    const Text(
                      'Mystery Dining Edition',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                widgetDescription: const Column(
                  children: [
                    Text(
                      'Where Every Meal is a Delicious Mystery',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Let the Adventure Unfold on Your Plate!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                // pathImage: ,
              ),
              ContentConfig(
                widgetTitle: const Column(
                  children: [
                    Text(
                      'Cuisine types',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'To tailor your dining recommendations, please choose cuisine types',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                pathImage: 'assets/images/restaurant.png',
                widgetDescription: CuisinesWrap(
                  onSelectedCousines: (cuisines) {
                    setState(() {
                      selectedCousines = cuisines;
                    });
                  },
                ),
              ),
              ContentConfig(
                widgetTitle: const Column(
                  children: [
                    Text(
                      'City',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'To find the best dining spots near you, select your city below',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                widgetDescription: CountryWrap(
                  onSelectLocale: (locale) {
                    setState(() {
                      selectedLocale = locale;
                    });
                  },
                ),
              ),
              ContentConfig(
                widgetTitle: const Column(
                  children: [
                    Text(
                      'Categories & Services',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'These help users understand the options available to them when searching for restaurants',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                widgetDescription: CategoriesWrap(
                  onSelectedCategories: (categories) {
                    setState(() {
                      selectedCategories = categories;
                    });
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class CuisinesWrap extends StatefulWidget {
  const CuisinesWrap({required this.onSelectedCousines, super.key});

  final void Function(List<String>) onSelectedCousines;

  @override
  State<CuisinesWrap> createState() => _CuisinesWrapState();
}

class _CuisinesWrapState extends State<CuisinesWrap>
    with AutomaticKeepAliveClientMixin {
  final List<String> selectedCousines = [];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      alignment: WrapAlignment.spaceEvenly,
      children: CuisineTypes.values
          .map(
            (e) => InputChip(
              onPressed: () {
                setState(() {
                  if (selectedCousines.contains(e.name)) {
                    selectedCousines.remove(e.name);
                  } else {
                    selectedCousines.add(e.name);
                  }
                });
                widget.onSelectedCousines(selectedCousines);
              },
              label: Text(e.name),
              labelStyle: const TextStyle(fontSize: 18),
              selected: selectedCousines.contains(e.name),
              showCheckmark: true,
            ),
          )
          .toList(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class CountryWrap extends StatefulWidget {
  const CountryWrap({required this.onSelectLocale, super.key});

  final void Function(LocaleInfo) onSelectLocale;

  @override
  State<CountryWrap> createState() => _CountryWrapState();
}

class _CountryWrapState extends State<CountryWrap>
    with AutomaticKeepAliveClientMixin {
  LocaleInfo? selectedLocale;

  List<LocaleInfo> locales = [];
  Set<String> seen = <String>{};

  @override
  void initState() {
    super.initState();
    locales = AppLocale.cs_CZ.allLocalesInfo
        .where((country) => seen.add(country.country))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Autocomplete<LocaleInfo>(
          // optionsViewOpenDirection: OptionsViewOpenDirection.up,
          displayStringForOption: (option) {
            return option.country;
          },
          fieldViewBuilder:
              (context, textEditingController, focusNode, onFieldSubmitted) {
            return TextFormField(
              cursorColor: Colors.white,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your country';
                }
                return null;
              },
              onFieldSubmitted: (value) => onFieldSubmitted(),
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                labelText: 'Country',
                labelStyle: TextStyle(color: Colors.white),
              ),
              controller: textEditingController,
              focusNode: focusNode,
            );
          },
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text == '') {
              return const Iterable<LocaleInfo>.empty();
            }
            return locales.where((option) {
              return option.country
                  .toLowerCase()
                  .contains(textEditingValue.text.toLowerCase());
            });
          },
          onSelected: (selection) {
            setState(() {
              selectedLocale = selection;
            });
            widget.onSelectLocale(selection);
          },
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class CategoriesWrap extends StatefulWidget {
  const CategoriesWrap({required this.onSelectedCategories, super.key});

  final void Function(List<CategoryTypes>) onSelectedCategories;

  @override
  State<CategoriesWrap> createState() => _CategoriesWrapState();
}

class _CategoriesWrapState extends State<CategoriesWrap>
    with AutomaticKeepAliveClientMixin {
  final List<CategoryTypes> selectedCategories = [];

  final List<CategoryTypes> categories = CategoryTypes.values;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      alignment: WrapAlignment.spaceEvenly,
      children: categories
          .map(
            (e) => InputChip(
              onPressed: () {
                setState(() {
                  if (selectedCategories.contains(e)) {
                    selectedCategories.remove(e);
                  } else {
                    selectedCategories.add(e);
                  }
                });
                widget.onSelectedCategories(selectedCategories);
              },
              label: Text(e.displayName),
              labelStyle: const TextStyle(fontSize: 18),
              selected: selectedCategories.contains(e),
              showCheckmark: true,
            ),
          )
          .toList(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
