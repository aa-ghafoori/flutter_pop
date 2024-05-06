import 'package:flutter/services.dart';

class CardExpirationFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newValueString = newValue.text;
    String valueToReturn = '';

    for (int i = 0; i < newValueString.length; i++) {
      if (newValueString[i] != '/') {
        valueToReturn += newValueString[i];
      }

      var nonZeroIndex = i + 1;

      if (nonZeroIndex % 2 == 0 &&
          nonZeroIndex != newValueString.length &&
          nonZeroIndex < 4) {
        // Add this condition
        valueToReturn += '/';
      }
    }

    // Ensure the format is MM/YY
    if (valueToReturn.length > 5) {
      valueToReturn = valueToReturn.substring(0, 5);
    }

    return newValue.copyWith(
      text: valueToReturn,
      selection: TextSelection.fromPosition(
        TextPosition(offset: valueToReturn.length),
      ),
    );
  }
}
