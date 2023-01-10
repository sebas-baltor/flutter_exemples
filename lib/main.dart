import 'package:examples_test/pages/fade_widget_in_out.dart';
import 'package:examples_test/pages/random_square_animation.dart';
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RandomSquareAnimation(
                                title: "random square animation",
                              )));
                },
              ),
            ),
          ],
        ));
  }
}
