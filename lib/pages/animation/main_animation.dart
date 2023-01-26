import "package:flutter/material.dart";
import "animate_page_transition.dart";
import "fade_widget_in_out.dart";
import 'random_square_animation.dart';
import 'animate_widget_using_physics.dart';

class MainAnimation extends StatefulWidget {
  const MainAnimation({super.key, required this.title});
  final String title;

  @override
  State<MainAnimation> createState() => _MainAnimationState();
}

class _MainAnimationState extends State<MainAnimation> {
  int _indexSelectedItem = 0;
  static const List<Widget> _widgets = <Widget>[
    AnimatePageTransition(title: "Animate Page Transition"),
    RandomSquareAnimation(title: "Random Square Animation"),
    FadeWidgetInOut(title: "Fade Widget In Out"),
    AnimateWidgetUsingPhysics(title: "Animate a Widget Using Physics Simulator")
  ];
  void _onItemTapped(int index) {
    setState(() {
      _indexSelectedItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text(widget.title),
      ),
      body: _widgets.elementAt(_indexSelectedItem),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black26,
        currentIndex: _indexSelectedItem,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.layers), label: "transition"),
          BottomNavigationBarItem(icon: Icon(Icons.shuffle), label: "random"),
          BottomNavigationBarItem(
              icon: Icon(Icons.animation), label: "fade inout"),
          BottomNavigationBarItem(
              icon: Icon(Icons.drag_indicator), label: "physic"),
        ],
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
