import "package:flutter/material.dart";
import 'drawer_menu.dart';
import 'ui_based_orientation.dart';

class MainDesign extends StatefulWidget {
  const MainDesign({super.key,required this.title});
  final String title;
  @override
  State<MainDesign> createState() => _MainDesignState();
}

class _MainDesignState extends State<MainDesign> {
  int _selectedItems = 0;
  // list of widgets sorted by index
  // will be render in the scafold's body
  // depend in the index of selected item
  static const List<Widget> _widgets = <Widget>[
    DrawerMenu(title: "Drawer Menu Example"),
    UiBasesOrientation(title: "Ui Based Orientation")
  ];
  void _onItemTapped (int index){
    setState(() {
      _selectedItems = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: _widgets.elementAt(_selectedItems),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedItems,
        // fixedColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.menu),label: "drawer",),
          BottomNavigationBarItem(icon: Icon(Icons.screen_rotation),label:"orientation"),
        ],
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

