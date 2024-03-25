// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:collection/collection.dart';

enum AppLocale {
  cs_CZ, // Czech Republic - Czech - Prague, Czech Republic
  da_DK, // Denmark - Danish - Copenhagen, Denmark
  de_AT, // Austria - German - Vienna, Austria
  de_CH, // Switzerland - German - Zurich, Switzerland
  de_DE, // Germany - German - Berlin, Germany
  en_AU, // Australia - English - Sydney, Australia
  en_BE, // Belgium - English - Brussels, Belgium
  en_CA, // Canada - English - Toronto, Canada
  en_CH, // Switzerland - English - Geneva, Switzerland
  en_GB, // United Kingdom - English - London, United Kingdom
  en_HK, // Hong Kong - English - Hong Kong, China
  en_IE, // Republic of Ireland - English - Dublin, Ireland
  en_MY, // Malaysia - English - Kuala Lumpur, Malaysia
  en_NZ, // New Zealand - English - Wellington, New Zealand
  en_PH, // Philippines - English - Manila, Philippines
  en_SG, // Singapore - English - Singapore, Singapore
  en_US, // United States - English - New York City, United States
  es_AR, // Argentina - Spanish - Buenos Aires, Argentina
  es_CL, // Chile - Spanish - Santiago, Chile
  es_ES, // Spain - Spanish - Madrid, Spain
  es_MX, // Mexico - Spanish - Mexico City, Mexico
  fi_FI, // Finland - Finnish - Helsinki, Finland
  fil_PH, // Philippines - Filipino - Manila, Philippines
  fr_BE, // Belgium - French - Brussels, Belgium
  fr_CA, // Canada - French - Montreal, Canada
  fr_CH, // Switzerland - French - Geneva, Switzerland
  fr_FR, // France - French - Paris, France
  it_CH, // Switzerland - Italian - Lugano, Switzerland
  it_IT, // Italy - Italian - Rome, Italy
  ja_JP, // Japan - Japanese - Tokyo, Japan
  ms_MY, // Malaysia - Malay - Kuala Lumpur, Malaysia
  nb_NO, // Norway - Norwegian - Oslo, Norway
  nl_BE, // Belgium - Dutch - Brussels, Belgium
  nl_NL, // The Netherlands - Dutch - Amsterdam, Netherlands
  pl_PL, // Poland - Polish - Warsaw, Poland
  pt_BR, // Brazil - Portuguese - Sao Paulo, Brazil
  pt_PT, // Portugal - Portuguese - Lisbon, Portugal
  sv_FI, // Finland - Swedish - Helsinki, Finland
  sv_SE, // Sweden - Swedish - Stockholm, Sweden
  tr_TR, // Turkey - Turkish - Istanbul, Turkey
  zh_HK, // Hong Kong - Chinese - Hong Kong, China
  zh_TW, // Taiwan - Chinese - Taipei, Taiwan
}

class LocaleInfo {
  const LocaleInfo(this.code, this.city, this.country);
  final String code;
  final String city;
  final String country;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'city': city,
      'country': country,
    };
  }

  factory LocaleInfo.fromMap(Map<String, dynamic> map) {
    return LocaleInfo(
      map['code'] as String,
      map['city'] as String,
      map['country'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LocaleInfo.fromJson(String source) =>
      LocaleInfo.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension LocaleExtension on AppLocale {
  List<LocaleInfo> get allLocalesInfo {
    return AppLocale.values.map((e) => e.info).toList();
  }

  LocaleInfo get info {
    switch (this) {
      case AppLocale.cs_CZ:
        return const LocaleInfo('cs_CZ', 'Prague', 'Czech Republic');
      case AppLocale.da_DK:
        return const LocaleInfo('da_DK', 'Copenhagen', 'Denmark');
      case AppLocale.de_AT:
        return const LocaleInfo('de_AT', 'Vienna', 'Austria');
      case AppLocale.de_CH:
        return const LocaleInfo('de_CH', 'Zurich', 'Switzerland');
      case AppLocale.de_DE:
        return const LocaleInfo('de_DE', 'Berlin', 'Germany');
      case AppLocale.en_AU:
        return const LocaleInfo('en_AU', 'Sydney', 'Australia');
      case AppLocale.en_BE:
        return const LocaleInfo('en_BE', 'Brussels', 'Belgium');
      case AppLocale.en_CA:
        return const LocaleInfo('en_CA', 'Toronto', 'Canada');
      case AppLocale.en_CH:
        return const LocaleInfo('en_CH', 'Geneva', 'Switzerland');
      case AppLocale.en_GB:
        return const LocaleInfo('en_GB', 'London', 'United Kingdom');
      case AppLocale.en_HK:
        return const LocaleInfo('en_HK', 'Hong Kong', 'China');
      case AppLocale.en_IE:
        return const LocaleInfo('en_IE', 'Dublin', 'Ireland');
      case AppLocale.en_MY:
        return const LocaleInfo('en_MY', 'Kuala Lumpur', 'Malaysia');
      case AppLocale.en_NZ:
        return const LocaleInfo('en_NZ', 'Wellington', 'New Zealand');
      case AppLocale.en_PH:
        return const LocaleInfo('en_PH', 'Manila', 'Philippines');
      case AppLocale.en_SG:
        return const LocaleInfo('en_SG', 'Singapore', 'Singapore');
      case AppLocale.en_US:
        return const LocaleInfo('en_US', 'New York City', 'United States');
      case AppLocale.es_AR:
        return const LocaleInfo('es_AR', 'Buenos Aires', 'Argentina');
      case AppLocale.es_CL:
        return const LocaleInfo('es_CL', 'Santiago', 'Chile');
      case AppLocale.es_ES:
        return const LocaleInfo('es_ES', 'Madrid', 'Spain');
      case AppLocale.es_MX:
        return const LocaleInfo('es_MX', 'Mexico City', 'Mexico');
      case AppLocale.fi_FI:
        return const LocaleInfo('fi_FI', 'Helsinki', 'Finland');
      case AppLocale.fil_PH:
        return const LocaleInfo('fil_PH', 'Manila', 'Philippines');
      case AppLocale.fr_BE:
        return const LocaleInfo('fr_BE', 'Brussels', 'Belgium');
      case AppLocale.fr_CA:
        return const LocaleInfo('fr_CA', 'Montreal', 'Canada');
      case AppLocale.fr_CH:
        return const LocaleInfo('fr_CH', 'Geneva', 'Switzerland');
      case AppLocale.fr_FR:
        return const LocaleInfo('fr_FR', 'Paris', 'France');
      case AppLocale.it_CH:
        return const LocaleInfo('it_CH', 'Lugano', 'Switzerland');
      case AppLocale.it_IT:
        return const LocaleInfo('it_IT', 'Rome', 'Italy');
      case AppLocale.ja_JP:
        return const LocaleInfo('ja_JP', 'Tokyo', 'Japan');
      case AppLocale.ms_MY:
        return const LocaleInfo('ms_MY', 'Kuala Lumpur', 'Malaysia');
      case AppLocale.nb_NO:
        return const LocaleInfo('nb_NO', 'Oslo', 'Norway');
      case AppLocale.nl_BE:
        return const LocaleInfo('nl_BE', 'Brussels', 'Belgium');
      case AppLocale.nl_NL:
        return const LocaleInfo('nl_NL', 'Amsterdam', 'Netherlands');
      case AppLocale.pl_PL:
        return const LocaleInfo('pl_PL', 'Warsaw', 'Poland');
      case AppLocale.pt_BR:
        return const LocaleInfo('pt_BR', 'Sao Paulo', 'Brazil');
      case AppLocale.pt_PT:
        return const LocaleInfo('pt_PT', 'Lisbon', 'Portugal');
      case AppLocale.sv_FI:
        return const LocaleInfo('sv_FI', 'Helsinki', 'Finland');
      case AppLocale.sv_SE:
        return const LocaleInfo('sv_SE', 'Stockholm', 'Sweden');
      case AppLocale.tr_TR:
        return const LocaleInfo('tr_TR', 'Istanbul', 'Turkey');
      case AppLocale.zh_HK:
        return const LocaleInfo('zh_HK', 'Hong Kong', 'China');
      case AppLocale.zh_TW:
        return const LocaleInfo('zh_TW', 'Taipei', 'Taiwan');
    }
  }
}

enum CuisineTypes {
  Italian,
  Mexican,
  Japanese,
  American,
  Indian,
  Chinese,
  French,
  Thai,
  Greek,
  Spanish,
}

enum CategoryTypes {
  hotNew('Hot and New', 'hot_and_new'),
  openToAll('Open To All', 'open_to_all'),
  reservations('Yelp Reservations', 'reservation'),
  wheelchairAccesible('Wheelchair Accessible', 'wheelchair_accessible'),
  waitList('Yelp Wait List', 'waitlist_reservation'),
  deals('Yelp Deals', 'deals'),
  genderNeutral('Gender Neutral Restrooms', 'gender_neutral_restrooms');

  const CategoryTypes(this.displayName, this.reqValue);

  final String displayName;
  final String reqValue;
}

extension CategoryTypesExtension on CategoryTypes {
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'displayName': displayName,
      'reqValue': reqValue,
    };
  }

  CategoryTypes fromMap(Map<String, dynamic> map) {
    final name = map['displayName'] as String;
    final value = map['reqValue'] as String;
    return CategoryTypes.values.firstWhere(
      (element) => element.displayName == name && element.reqValue == value,
    );
  }

  String toJson() => json.encode(toMap());

  CategoryTypes? fromJson(String source) =>
      fromMap(json.decode(source) as Map<String, dynamic>);
}
