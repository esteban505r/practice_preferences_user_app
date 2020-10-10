import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences{
  static final UserPreferences userPreferences = UserPreferences._internal();

  factory UserPreferences(){
    return userPreferences;
  }

  UserPreferences._internal();

  SharedPreferences _preferences;

  initPrefs() async {
    _preferences = await SharedPreferences.getInstance();
  }

  int get gender {
    return _preferences.getInt('gender')??1;
  }

  set gender(int gender){
    _preferences.setInt('gender', gender);
  }

  String get name {
    return _preferences.getString('name')??"Pedro";
  }

  set name(String name){
    _preferences.setString('name', name);
  }

  bool get secondaryColor {
    return _preferences.getBool('secondaryColor')??false;
  }

  set secondaryColor(bool secondaryColor){
    _preferences.setBool('secondaryColor', secondaryColor);
  }

  String get lastPage{
    return _preferences.getString('lastPage')??'home';
  }

  set lastPage(String lastPage){
    _preferences.setString('lastPage', lastPage);
  }


}