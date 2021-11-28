const String languageName = 'name';
const String languageIsoCode = 'isoCode';

class Language {
  Language({required this.isoCode, required this.name});

  Language.fromMap({required Map<String, String> map})
      : name = map[languageName]!,
        isoCode = map[languageIsoCode]!;

  final String name;
  final String isoCode;
}

final List<Map<String, String>> defaultLanguagesList = <Map<String, String>>[
  <String, String>{languageIsoCode: 'en', languageName: 'English'},
  <String, String>{languageIsoCode: 'sl', languageName: 'Slovensko'},
];
