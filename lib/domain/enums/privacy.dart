import 'dart:collection';

enum Privacy {
  public(1),
  private(2);

  const Privacy(this.value);
  final int value;

  // Get the Privacy from its integer value
  static Privacy fromIntValue(int value) {
    return Privacy.values.firstWhere(
      (e) => e.value == value, 
      orElse: () => throw ArgumentError("Invalid Privacy: $value"),
    );
  }

  static Privacy fromStringValue(String value) {
    HashMap<String, Privacy> privacyStringMap = HashMap();
    privacyStringMap['public'] = Privacy.public;
    privacyStringMap['private'] = Privacy.private;

    return privacyStringMap[value] ?? Privacy.public;
  }

  int toJson() => value;

  @override
  String toString(){
    HashMap<int, String> privacyIntToStringMap = HashMap();
    privacyIntToStringMap[1] = 'public';
    privacyIntToStringMap[2] = 'private';

    return privacyIntToStringMap[value] ?? 'public';
  }
}