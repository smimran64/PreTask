class LanguageModel {
  final String name;
  final String code;
  final String flagEmoji;
  bool isSelected;

  LanguageModel({
    required this.name,
    required this.code,
    required this.flagEmoji,
    this.isSelected = false,
  });
}