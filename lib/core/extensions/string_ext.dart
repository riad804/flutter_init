extension StringX on String {
  bool get isBlank => trim().isEmpty;
  String capitalize() => isEmpty ? this : this[0].toUpperCase() + substring(1);
}