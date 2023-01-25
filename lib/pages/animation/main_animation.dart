import "package:flutter/material.dart";
import "animate_page_transition.dart";
import "fade_widget_in_out.dart";
import 'random_square_animation.dart';
import 'animate_widget_using_physics.dart';

class MainAnimation extends StatelessWidget {
  const MainAnimation({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
            bottom: const TabBar(tabs: [
              Tab(icon: Icon(Icons.layers)),
              Tab(icon: Icon(Icons.shuffle)),
              Tab(icon: Icon(Icons.animation)),
              Tab(icon: Icon(Icons.drag_indicator))
            ]),
          ),
          body: const TabBarView(children: [
            AnimatePageTransition(title: "Animate Page Transition"),
            RandomSquareAnimation(title: "Random Square Animation"),
            FadeWidgetInOut(title: "Fade Widget In out"),
            AnimateWidgetUsingPhysics(title:"Animate Widget Using Physics Simulator")
          ]),
        ));
  }
}
