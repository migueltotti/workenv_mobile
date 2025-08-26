import 'package:flutter/services.dart';

class CpfCnpjFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (text.length <= 11) {
      // CPF: 000.000.000-00
      text = text.replaceAllMapped(
        RegExp(r'(\d{0,3})(\d{0,3})(\d{0,3})(\d{0,2})'),
        (Match match) {
          String part1 = match.group(1) ?? '';
          String part2 = match.group(2) ?? '';
          String part3 = match.group(3) ?? '';
          String part4 = match.group(4) ?? '';

          String formatted = part1;
          if (part2.isNotEmpty) formatted += '.$part2';
          if (part3.isNotEmpty) formatted += '.$part3';
          if (part4.isNotEmpty) formatted += '-$part4';

          return formatted;
        },
      );
    } else {
      // CNPJ: 00.000.000/0000-00
      text =
          text.length <= 14
              ? text.substring(0, text.length)
              : text.substring(0, 14);
      text = text.replaceAllMapped(
        RegExp(r'(\d{0,2})(\d{0,3})(\d{0,3})(\d{0,4})(\d{0,2})'),
        (Match match) {
          String part1 = match.group(1) ?? '';
          String part2 = match.group(2) ?? '';
          String part3 = match.group(3) ?? '';
          String part4 = match.group(4) ?? '';
          String part5 = match.group(5) ?? '';

          String formatted = part1;
          if (part2.isNotEmpty) formatted += '.$part2';
          if (part3.isNotEmpty) formatted += '.$part3';
          if (part4.isNotEmpty) formatted += '/$part4';
          if (part5.isNotEmpty) formatted += '-$part5';

          return formatted;
        },
      );
    }

    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
