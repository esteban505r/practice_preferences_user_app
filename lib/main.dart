import 'package:flutter/material.dart';
import 'package:preferences_user_app/src/pages/home_page.dart';
import 'package:preferences_user_app/src/routes.dart';
import 'package:preferences_user_app/src/shared_preferences/user_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new UserPreferences();
  await prefs.initPrefs();
  runApp(App());
}

class App extends StatefulWidget{

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final prefs = new UserPreferences();
  ThemeData _mainData = ThemeData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      routes: getRoutes(),
      home: HomePage(
        onThemeChange:(ThemeData data){
          _mainData = data;
          setState(() {});
        }
      ),
      theme: _mainData
    );
  }
}