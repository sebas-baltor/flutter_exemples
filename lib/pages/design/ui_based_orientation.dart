import "package:flutter/material.dart";

class UiBasesOrientation extends StatelessWidget {
  const UiBasesOrientation({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          automaticallyImplyLeading: false,
        ),
        body: OrientationBuilder(
          //determinated the orientation in base witdth and height
          builder: (context, orientation) {
            return GridView.count(
                crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
                children: List.generate(8, (index) {
                  return Center(
                    child: Text(
                      "Item $index",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  );
                }));
          },
        ));
  }
}
