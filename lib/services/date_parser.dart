class DateParser {
  DateTime parseFromDMY(String date) {
    final parts = date.split('/');

    if (parts.length == 3) {
      final day = int.parse(parts[0]);
      final month = int.parse(parts[1]);
      final year = int.parse(parts[2]);

      return DateTime(year, month, day);
    }

    throw FormatException('Invalid date format');
  }
}
