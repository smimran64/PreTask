import 'package:get/get.dart';
import 'package:smt_task/features/language/model/language_model.dart';
class LanguageController extends GetxController {
  var languages = <LanguageModel>[].obs;
  var selectedLanguage = Rx<LanguageModel?>(null);

  @override
  void onInit() {
    super.onInit();
    loadLanguages();
  }

  void loadLanguages() {
    languages.value = [
      LanguageModel(
        name: 'English (US)',
        code: 'en_US',
        flagEmoji: '🇺🇸',
        isSelected: true,
      ),
      LanguageModel(
        name: 'Indonesia',
        code: 'id',
        flagEmoji: '🇮🇩',
      ),
      LanguageModel(
        name: 'Afghanistan',
        code: 'af',
        flagEmoji: '🇦🇫',
      ),
      LanguageModel(
        name: 'Algeria',
        code: 'dz',
        flagEmoji: '🇩🇿',
      ),
      LanguageModel(
        name: 'Malaysia',
        code: 'my',
        flagEmoji: '🇲🇾',
      ),
      LanguageModel(
        name: 'Arabic',
        code: 'ar',
        flagEmoji: '🇦🇪',
      ),
    ];

    selectedLanguage.value = languages.firstWhere(
      (lang) => lang.isSelected,
      orElse: () => languages.first,
    );
  }

  void selectLanguage(LanguageModel language) {
    for (var lang in languages) {
      lang.isSelected = false;
    }
    language.isSelected = true;
    selectedLanguage.value = language;
    languages.refresh();
  }

  void continueToNextScreen() {
    if (selectedLanguage.value != null) {
      print('Selected Language: ${selectedLanguage.value!.name}');
     
    }
  }
}