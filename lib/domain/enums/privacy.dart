import 'dart:collection';

enum Privacy {
  public(1),
  private(2);

  const Privacy(this.value);
  final int value;

  // Get the Privacy from its integer value
  static Privacy fromIntValue(int value) {
    switch (value) {
      case 1:
        return Privacy.public;
      case 2:
        return Privacy.private;
      default:
        throw ArgumentError('Invalid privacy value: $value');
    }
  }

  static Privacy fromStringValue(String value) {
    HashMap<String, Privacy> privacyStringMap = HashMap();
    privacyStringMap['public'] = Privacy.public;
    privacyStringMap['private'] = Privacy.private;

    return privacyStringMap[value] ?? Privacy.public;
  }

  int toStringValue() => value;

  @override
  String toString(){
    HashMap<int, String> privacyIntToStringMap = HashMap();
    privacyIntToStringMap[1] = 'public';
    privacyIntToStringMap[2] = 'private';

    return privacyIntToStringMap[value] ?? 'public';
  }
}