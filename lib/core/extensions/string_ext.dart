extension StringX on String {
  bool get isBlank => trim().isEmpty;
  String capitalize() => isEmpty ? this : this[0].toUpperCase() + substring(1);

  bool get isNotBlank => trim().isNotEmpty;

  String toTitleCase() => split(' ')
      .map(
        (word) => word.isEmpty
            ? word
            : word[0].toUpperCase() + word.substring(1).toLowerCase(),
      )
      .join(' ');

  bool get isNumeric => RegExp(r'^-?[0-9]+$').hasMatch(this);

  String? nullIfBlank() => isBlank ? null : this;

  /// Returns true if the string is a valid email address.
  bool get isEmail => RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$').hasMatch(this);

  /// Returns true if the string is a valid URL.
  bool get isUrl => RegExp(
    r'^(http|https):\/\/([\w\-]+\.)+[\w\-]+(\/[\w\-\.]*)*\/?$',
  ).hasMatch(this);

  /// Removes all whitespace from the string.
  String removeAllWhitespace() => replaceAll(RegExp(r'\s+'), '');

  /// Returns the reversed string.
  String get reversed => split('').reversed.join();

  /// Returns true if the string contains only alphabetic characters.
  bool get isAlpha => RegExp(r'^[a-zA-Z]+$').hasMatch(this);
}
