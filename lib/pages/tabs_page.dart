import 'package:flutter/material.dart';

import '../pages/catigories_page.dart';
import '../pages/favorites_page.dart';
import '../widgets/main_drawer.dart';

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  List<Map<String, Object>> allPages = [
    {
      'page': CategoriesPage(),
      'title': 'Category',
    },
    {
      'page': FavritesPage(),
      'title': 'Your Favorites',
    },
  ];
  int pagesIndex = 0;

  @override
  Widget build(BuildContext context) {
    final myTheme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          allPages[pagesIndex]['title'],
        ),
      ),
      body: allPages[pagesIndex]['page'],
      bottomNavigationBar: _builtNavigationBar(myTheme),
      drawer: Drawer(
        child: MainDrawer(),
      ),
    );
  }

  void _selectTab(int index) {
    setState(() {
      pagesIndex = index;
    });
  }

  Widget _builtNavigationBar(ThemeData myTheme) {
    return BottomNavigationBar(
        elevation: 3,
        selectedFontSize: 16,
        backgroundColor: myTheme.primaryColor,
        selectedItemColor: myTheme.accentColor,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.shifting,
        currentIndex: pagesIndex,
        onTap: _selectTab,
        items: [
          BottomNavigationBarItem(
            backgroundColor: myTheme.primaryColor,
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            backgroundColor: myTheme.primaryColor,
            icon: Icon(Icons.star),
            label: 'Favorite',
          )
        ]);
  }
}

/*DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.category,
                ),
                text: 'categories',
              ),
              Tab(
                icon: Icon(
                  Icons.star,
                ),
                text: 'favorites',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [CategoriesPage(), FavritesPage()],
        ),*/
