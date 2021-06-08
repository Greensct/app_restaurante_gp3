import 'package:app_restaurante_gp3/models/dark_theme_preferences.dart';
import 'package:flutter/material.dart';


/* Proovedor que activa o desactiva el tema oscuro */
class DarkThemeProvider with ChangeNotifier{
 DarkThemePreferences darkThemePreferences = DarkThemePreferences();
  bool _darkTheme = false ;
  bool get darkTheme=>_darkTheme;

  set darkTheme (bool value){
    _darkTheme = value;
    darkThemePreferences.setDarkTheme(value);
    notifyListeners();
  }
}