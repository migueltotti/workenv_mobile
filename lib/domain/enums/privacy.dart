enum Privacy {
  public(1),
  private(2);

  const Privacy(this.value);
  final int value;

  // Get the Privacy from its integer value
  static Privacy fromValue(int value) {
    return Privacy.values.firstWhere(
      (e) => e.value == value, 
      orElse: () => throw ArgumentError("Invalid Privacy: $value"),
    );
  }

  int toJson() => value;
}