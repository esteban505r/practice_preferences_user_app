import 'package:flutter/material.dart';
import 'package:preferences_user_app/src/pages/info_page.dart';
import 'package:preferences_user_app/src/pages/preferences_page.dart';
import 'package:preferences_user_app/src/shared_preferences/user_preferences.dart';

class HomePage extends StatelessWidget {

  Function(ThemeData data) onThemeChange;

  HomePage({this.onThemeChange});

  UserPreferences userPreferences = new UserPreferences();
  String _lastPage = 'home';



  @override
  Widget build(BuildContext context) {
    _lastPage = userPreferences.lastPage;
    PageController _controller;
    switch(_lastPage){
      case 'home':
        _controller = new PageController(initialPage: 0);
        break;
      case 'preferences':
        _controller = new PageController(initialPage: 1);
        break;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Preferencias de usuario'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Container(),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/menu_img.jpg"),
                      fit: BoxFit.cover
                  )
              ),
            ),
            ListTile(
              leading: Icon(Icons.pages),
              title: Text("Home"),
              onTap: (){
                Navigator.pop(context);
                _controller.jumpToPage(0);
                userPreferences.lastPage = 'home';
              },
            ),
            ListTile(
              leading: Icon(Icons.party_mode),
              title: Text("Party"),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text("People"),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: (){
                Navigator.pop(context);
                _controller.jumpToPage(1);
                userPreferences.lastPage = 'preferences';
              },
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _controller,
        pageSnapping: false,
        children: [
          InfoPage(),
          PreferencesPage(onThemeChange: onThemeChange,)
        ],
      )
    );
  }
}
