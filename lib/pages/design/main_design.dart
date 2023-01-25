import "package:flutter/material.dart";
import 'drawer_menu.dart';
import 'ui_based_orientation.dart';

class MainDesign extends StatelessWidget {
  const MainDesign({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text("All Examples Of Design Flutter's Coockbook")),
          ListTile(
            title: const Text("Drawer Menu example"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const DrawerMenu(title: "Drawer example")));
            },
          ),
          ListTile(
            title: const Text("Ui Based Oriention"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UiBasesOrientation(
                          title: "Ui based orientation")));
            },
          )
        ],
      )),
    );
  }
}
