import 'package:flutter/material.dart';

import '../pages/filters_page.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData myTheme = Theme.of(context);

    return Drawer(
      child: Column(
        children: [
          Container(
            height: 140,
            width: 500,
            color: myTheme.accentColor,
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
            alignment: Alignment.centerLeft,
            child: Text(
              'cooking Time',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: myTheme.primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _ListTile(Icons.restaurant, myTheme, 'Meals', () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          Divider(),
          _ListTile(Icons.settings, myTheme, 'Filters', () {
            Navigator.of(context).pushReplacementNamed(FiltersPage.routeName);
          }),
        ],
      ),
    );
  }
}

class _ListTile extends StatelessWidget {
  final IconData icon;
  final ThemeData myTheme;
  final String title;
  final Function onTap;
  const _ListTile(this.icon, this.myTheme, this.title, this.onTap);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          fontFamily: 'Roboto',
        ),
      ),
    );
  }
}

//Hint if u have no widget that need buileder methof like theme of mediaquerry use build widgets
//else user builder windgets becuase in case of builder methods the app only rebuild that
//widget not the entire
/* Widget _buildListTile(ThemeData myTheme, IconData icon, String title) {
    return ListTile(
      onTap: () {},
      leading: Icon(
        icon,
        size: 26,
        color: myTheme.accentColor,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          fontFamily: 'Roboto',
        ),
      ),
    );
  }*/
