import "package:flutter/material.dart";
class MainNavigation extends StatelessWidget {
  const MainNavigation({super.key,required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(title)
      ),
    );
  }
}