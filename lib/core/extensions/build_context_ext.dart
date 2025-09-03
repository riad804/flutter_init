import 'package:flutter/material.dart';

extension ContextX on BuildContext {
  // Show a simple SnackBar
  void showSnack(String msg) =>
      ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(msg)));

  // Get screen size, width, and height
  Size get screenSize => MediaQuery.of(this).size;
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  // Theme and text theme
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;

  // Navigator
  NavigatorState get navigator => Navigator.of(this);

  // Unfocus keyboard
  void unfocus() => FocusScope.of(this).unfocus();

  // Check if dark mode is enabled
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  // Get padding and viewInsets (useful for safe area and keyboard)
  EdgeInsets get padding => MediaQuery.of(this).padding;
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;

  // Get orientation
  Orientation get orientation => MediaQuery.of(this).orientation;

  // Get platform brightness
  Brightness get platformBrightness => MediaQuery.of(this).platformBrightness;

  // Get device pixel ratio
  double get devicePixelRatio => MediaQuery.of(this).devicePixelRatio;
}
