import "package:flutter/material.dart";
// package to set te animation physics properties
// import 'package:flutter/physics.dart';

class AnimatePageTransition extends StatelessWidget {
  const AnimatePageTransition({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(title),
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(_createRoute());
        },
        child: const Text("Go!"),
      )),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const AnimatePage(),
      // made the option to animate the transition
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        // curves to animation
        var curve = Curves.ease;
        // combine tweens (interpolación)
        final tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        // rebuild themeselves when the animation value change
        return SlideTransition(
          // to use the tween
          position: animation.drive(tween),
          child: child,
        );
      });
}

// page will be animate
class AnimatePage extends StatelessWidget {
  const AnimatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Page 2'),
      ),
    );
  }
}
