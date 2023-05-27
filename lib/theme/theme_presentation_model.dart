import 'package:flutter/material.dart';

class ThemePresentationModel {
  final ThemeData theme;

  ThemePresentationModel({required this.theme});

  ThemePresentationModel copyWith({ThemeData? theme}) => ThemePresentationModel(theme: theme ?? this.theme);
}
