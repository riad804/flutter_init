import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@singleton
class ThemeService {
  final List<ThemeData> _themes = [
    ThemeData.light(),
    ThemeData.dark(),
    ThemeData(
      primarySwatch: Colors.teal,
      brightness: Brightness.light,
    ),
  ];

  final _themeController = BehaviorSubject<int>.seeded(0);

  Stream<ThemeData> get themeStream =>
      _themeController.stream.map((index) => _themes[index]);

  void setTheme(int index) {
    if (index >= 0 && index < _themes.length) {
      _themeController.add(index);
    }
  }

  int get currentIndex => _themeController.value;

  void dispose() {
    _themeController.close();
  }
}