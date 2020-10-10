import 'package:flutter/material.dart';
import 'package:preferences_user_app/src/shared_preferences/user_preferences.dart';


class PreferencesPage extends StatefulWidget {

  static final String routeName = 'preferencesPage';

  Function(ThemeData data) onThemeChange;

  PreferencesPage({this.onThemeChange});

  @override
  _PreferencesPageState createState() => _PreferencesPageState(onThemeChange);
}

class _PreferencesPageState extends State<PreferencesPage> {



  Function(ThemeData data) callBack;
  bool _secondaryColor = false;
  int _gender = 1;
  String _name = 'Pedro';
  TextEditingController _textEditingController = TextEditingController();
  UserPreferences userPreferences = new UserPreferences();

  _PreferencesPageState(this.callBack);

  @override
  void initState() {
    super.initState();
    _name = userPreferences.name;
    _gender = userPreferences.gender;
    _secondaryColor = userPreferences.secondaryColor;
    _textEditingController.text = _name;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:ListView(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text("Settings",style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold
            ),),
          ),
          Divider(),
          SwitchListTile(
            value: _secondaryColor,
            title: Text("Color Secundario"),
            onChanged: (bool value){
              _secondaryColor = value;
              userPreferences.secondaryColor = value;
              if(_secondaryColor) {
                callBack(ThemeData(
                  primaryColor: Colors.purple
                ));
              }
              else{
                callBack(ThemeData(
                    primaryColor: Colors.deepOrange
                ));
              }
              setState(() {});
            },
          ),
          RadioListTile(
            value: 1,
            title: Text("Masculino"),
            groupValue: _gender,
            onChanged:(int value) async {
              userPreferences.gender = value;
              _gender = value;
              setState(() {});
            },
          ),
          RadioListTile(
            value: 2,
            title: Text("Femenino "),
            groupValue: _gender,
            onChanged: (int value) async {
              userPreferences.gender = value;
              _gender = value;
              setState(() {});
            }
          ),
          Divider(),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:20.0),
              child: TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  helperText: 'Nombre de la persona usando el telefono'
                ),
                onChanged: (String value){
                  userPreferences.name = value;
                },
              ),
            ),
          )
        ],
      ),
    );
  }

}
