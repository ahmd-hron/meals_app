import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersPage extends StatefulWidget {
  static const String routeName = 'FiltersPage';
  final Function saveData;
  final Map<String, bool> filtersValue;
  const FiltersPage(this.saveData, this.filtersValue);
  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  bool _isGlutenFree;
  bool _isLactosFree;
  bool _isVegiterian;
  bool _isVegan;
  @override
  void initState() {
    _isGlutenFree = widget.filtersValue['gluteenFree'];
    _isLactosFree = widget.filtersValue['lactos free'];
    _isVegan = widget.filtersValue['Vegan'];
    _isVegiterian = widget.filtersValue['vegitriann'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filters'), actions: [
        IconButton(
          icon: Icon(Icons.save),
          onPressed: () {
            final Map<String, bool> filtersMap = {
              'gluteenFree': _isGlutenFree,
              'Vegan': _isVegan,
              'lactos free': _isLactosFree,
              'vegitriann': _isVegiterian
            };
            widget.saveData(filtersMap);
          },
        ),
      ]),
      body: Column(
        children: [
          Container(
            height: 80,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              'Adjust Your Meal Selections ',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w900,
                fontSize: 24,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile(
                'Glueetin-Free',
                'gluteen-free',
                _isGlutenFree,
                (newValue) {
                  setState(() {
                    _isGlutenFree = newValue;
                  });
                },
              ),
              _buildSwitchListTile(
                'Lactos-free',
                'lactos-free',
                _isLactosFree,
                (newValue) {
                  setState(() {
                    _isLactosFree = newValue;
                  });
                },
              ),
              _buildSwitchListTile(
                'Vegitrian',
                'vegetrian',
                _isVegiterian,
                (newValue) {
                  setState(() {
                    _isVegiterian = newValue;
                  });
                },
              ),
              _buildSwitchListTile(
                'Vegan',
                'vegan',
                _isVegan,
                (newValue) {
                  setState(() {
                    _isVegan = newValue;
                  });
                },
              )
            ],
          ))
        ],
      ),
      drawer: MainDrawer(),
    );
  }

  Widget _buildSwitchListTile(String title, String subtitle,
      bool switchCurrentValue, Function updateValue) {
    return SwitchListTile(
      value: switchCurrentValue,
      onChanged: updateValue,
      title: Text(
        title,
      ),
      subtitle: Text('include $subtitle meal'),
    );
  }
}
