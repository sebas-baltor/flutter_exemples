import "package:flutter/material.dart";
class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key,required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text("Drawer Header"),
            ),
            ListTile(
              title: const Text("item 1"),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("item 2"),
              onTap: (){
                Navigator.pop(context);
              },
            )
          ],
        )
      ),
    );
  }
}