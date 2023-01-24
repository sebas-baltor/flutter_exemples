import 'package:examples_test/pages/animation/fade_widget_in_out.dart';
import 'package:examples_test/pages/animation/random_square_animation.dart';
import 'package:examples_test/pages/animation/animate_page_transition.dart';

import 'package:examples_test/pages/design/drawer_menu.dart';
import 'package:examples_test/pages/design/ui_based_orientation.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LinksList(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// this class contain every single route to see the differents pages
class LinksList extends StatelessWidget {
  const LinksList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("examples"),
        ),
        body: Column(
          children: <Widget>[
            Center(
              child: ElevatedButton(
                child: const Text("fade in out go"),
                onPressed: () {
                  // push a layer (page) on the top and you go there
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FadeWidgetInOut(
                                title: "widget fade in out",
                              )));
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                child: const Text("random square animation"),
                onPressed: () {
                  // push a layer (page) on the top and you go there
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RandomSquareAnimation(
                                title: "random square animation",
                              )));
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                child: const Text("animate page route transition"),
                onPressed: (){
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> const AnimatePageTransition(title:"animate page route transition"))
                  );
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                child: const Text("Drawer menu") ,
                onPressed: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: 
                    (context) => const DrawerMenu(title: "drawer demo"))
                  );
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                child: const Text("Ui based on orientation"),
                onPressed: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: 
                    (context)=> const UiBasesOrientation(title: "ui based on orientation")
                    )
                  );
                },
                ),
            )
          ],
        ));
  }
}
