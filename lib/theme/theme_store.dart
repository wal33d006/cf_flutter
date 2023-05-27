import 'package:cf_flutter/theme/theme_presentation_model.dart';
import 'package:cf_flutter/theme/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeStore extends Cubit<ThemePresentationModel> {
  ThemeStore() : super(ThemePresentationModel(theme: lightTheme));

  setTheme(ThemeData theme) => emit(state.copyWith(theme: theme));
}
