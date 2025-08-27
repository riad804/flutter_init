import 'package:flutter/material.dart';


extension ContextX on BuildContext {
  void showSnack(String msg) => ScaffoldMessenger.of(this).showSnackBar(
    SnackBar(content: Text(msg)),
  );
}