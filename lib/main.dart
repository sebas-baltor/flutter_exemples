import 'package:examples_test/pages/animation/main_animation.dart';

import 'package:examples_test/pages/effect/main_effect.dart';
import 'package:examples_test/pages/navigation/main_navigation.dart';
import 'package:examples_test/pages/design/main_design.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
        textTheme: const TextTheme(
            headline1: TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent),
            headline5: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black26)),
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
          title: const Text("Flutter's coockbook"),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                  decoration: BoxDecoration(color: Colors.blue),
                  child: Text(
                      "Drawer to go to the differenst examples of flutter's coockbook")),
              ListTile(
                  title: const Text("Flutter's Animation Examples"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainAnimation(
                                title: "Flutters Animation Coockbook")));
                  }),
              ListTile(
                  title: const Text("Flutter's Design Examples"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainDesign(
                                title: "Flutter's Design Coockbook")));
                  }),
              ListTile(
                  title: const Text("Flutter's Effect Examples"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainEffect(
                                title: "Flutter's Effect Coockbook")));
                  }),
              ListTile(
                title: const Text("Flutter's Navigation Examples"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainNavigation(
                              title: "Flutter's Navigation Coockbook")));
                },
              )
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const FlutterLogo(
              size: 200,
            ),
            Column(
              children: <Widget>[
                Text(
                  "Examples from the flutter's coockbook",
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.center,
                ),
                Text(
                  "by @sebasbaltor",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
            MaterialButton(
              onPressed: () async {
                Uri uri = Uri.parse("https://docs.flutter.dev/cookbook");
                await launchUrl(uri);
              },
              color: Colors.blueAccent,
              child: const Text(
                "documentation",
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            )
          ],
        ));
  }
}
