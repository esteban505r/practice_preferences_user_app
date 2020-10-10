import 'package:flutter/material.dart';
import 'package:preferences_user_app/src/shared_preferences/user_preferences.dart';

class InfoPage extends StatelessWidget {

  UserPreferences userPreferences = new UserPreferences();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Color secundario: ${userPreferences.secondaryColor}'),
        Divider(),
        Text('Genero: ${userPreferences.gender} '),
        Divider(),
        Text('Nombre usuario: ${userPreferences.name}'),
        Divider(),
      ],
    );
  }
}
