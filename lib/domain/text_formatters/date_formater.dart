import 'package:flutter/services.dart';

class DateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    
    if (text.length > 8) {
      text = text.substring(0, 8);
    }
    
    // DD/MM/AAAA format
    if (text.length >= 3 && text.length <= 4) {
      text = '${text.substring(0, 2)}/${text.substring(2)}';
    } else if (text.length >= 5) {
      text = '${text.substring(0, 2)}/${text.substring(2, 4)}/${text.substring(4)}';
    }
    
    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}