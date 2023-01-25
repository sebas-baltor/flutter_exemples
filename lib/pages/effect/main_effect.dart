import "package:flutter/material.dart";
class MainEffect extends StatelessWidget {
  const MainEffect({super.key,required this.title});
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