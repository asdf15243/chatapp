  import 'package:flutter/material.dart';
  import 'color_palette.dart'; // your palette file

  class AppTheme {
    static ThemeData get darkTheme {
      return ThemeData(
        brightness: Brightness.dark,
        splashFactory: NoSplash.splashFactory,

        // Define color scheme
        colorScheme: ColorScheme.dark(
          primary: ColorPalette.buttonBackground,
          onPrimary: ColorPalette.buttonText,
          background: ColorPalette.background,
          surface: Color(0xFF2A2A2A),
          onSurface: ColorPalette.textPrimary,
          secondary: ColorPalette.textAccentBlue,
          onSecondary: ColorPalette.textPrimary,
          error: ColorPalette.textAccentRed,
          onError: ColorPalette.textPrimary,
        ),

        // Scaffold background
        scaffoldBackgroundColor: ColorPalette.scaffoldBackground,

        // AppBar styling
        appBarTheme: AppBarTheme(
          backgroundColor: ColorPalette.appBarBackground,
          foregroundColor: ColorPalette.textPrimary,
          elevation: 0,
        ),

        // Text styling
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: ColorPalette.textPrimary),
          bodyMedium: TextStyle(color: ColorPalette.textSecondary),
          labelLarge: TextStyle(color: ColorPalette.textPrimary),
        ),

        // Dialog styling
        dialogTheme: DialogTheme(
          backgroundColor: Color(0xFF2A2A2A),
          titleTextStyle: TextStyle(color: ColorPalette.textPrimary, fontSize: 18),
          contentTextStyle: TextStyle(color: ColorPalette.textSecondary),
        ),

        textSelectionTheme: TextSelectionThemeData(
          cursorColor: ColorPalette.textPrimary, // white cursor
          selectionColor: ColorPalette.textPrimary.withOpacity(0.3), // light white/grey highlight
          selectionHandleColor: ColorPalette.textPrimary, // slightly darker handle
        ),

        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(ColorPalette.textPrimary),
            overlayColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed) ||
                  states.contains(MaterialState.hovered) ||
                  states.contains(MaterialState.focused)) {
                return ColorPalette.textPrimary.withOpacity(0.2); // subtle highlight
              }
              return null;
            }),
            splashFactory: NoSplash.splashFactory, // removes ripple effect
          ),
        ),

        // SnackBar styling
        snackBarTheme: SnackBarThemeData(
          backgroundColor: Color(0xFF2A2A2A),
          contentTextStyle: TextStyle(color: ColorPalette.textPrimary),
        ),

        // Icon styling
        iconTheme: IconThemeData(
          color: ColorPalette.iconColor,
        ),

        // Divider styling
        dividerColor: ColorPalette.divider,
      );
    }
  }
