import 'package:flutter/services.dart';

class WordInputFormatter extends TextInputFormatter {
  final int maxWords;

  WordInputFormatter({this.maxWords = 45});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    final newWords = newValue.text.split(RegExp(r'\s+')).where((word) => word.isNotEmpty).toList();
    if (newWords.length > maxWords) {
      return oldValue;
    }
    return newValue;
  }
}
