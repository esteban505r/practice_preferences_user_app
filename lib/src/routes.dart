import 'package:flutter/material.dart';
import 'package:preferences_user_app/src/pages/home_page.dart';
import 'package:preferences_user_app/src/pages/preferences_page.dart';

Map<String,Widget Function(BuildContext)> getRoutes(){
  return{
    'homePage' : (BuildContext context) => HomePage(),
    'preferencesPage' : (BuildContext context) => PreferencesPage(),
  };
}