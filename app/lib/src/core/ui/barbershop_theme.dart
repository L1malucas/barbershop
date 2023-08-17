import 'package:barbershop/src/core/ui/contants.dart';
import 'package:flutter/material.dart';

sealed class BarbershopTheme {
  static const _defaultInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8.0),
      ),
      borderSide: BorderSide(color: ColorsContants.grey));
  static ThemeData themeData = ThemeData(
      useMaterial3: true,
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: _defaultInputBorder,
        border: _defaultInputBorder,
        focusedBorder: _defaultInputBorder,
        errorBorder: _defaultInputBorder.copyWith(
            borderSide: const BorderSide(color: ColorsContants.red)),
        filled: true,
        fillColor: ColorsContants.white,
        labelStyle: const TextStyle(
          color: ColorsContants.grey,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsContants.brown,
          foregroundColor: ColorsContants.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      fontFamily: FontsContants.fontFamily);
}
