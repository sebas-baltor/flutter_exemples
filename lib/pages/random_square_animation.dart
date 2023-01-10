import 'dart:math';

import "package:flutter/material.dart";

class RandomSquareAnimation extends StatefulWidget {
  const RandomSquareAnimation({super.key, required this.title});
  final String title;

  @override
  State<RandomSquareAnimation> createState() => _RandomSquareAnimationState();
}

class _RandomSquareAnimationState extends State<RandomSquareAnimation> {
  double _width = 40;
  double _height = 30;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          decoration: BoxDecoration(color: _color, borderRadius: _borderRadius),
          duration: const Duration(milliseconds: 1500),
          curve: Curves.bounceOut,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            final random = Random();
            _width = random.nextInt(300).toDouble();
            _height = random.nextInt(300).toDouble();

            _color = Color.fromRGBO(random.nextInt(256), random.nextInt(256),
                random.nextInt(256), 1);
            _borderRadius =
                BorderRadius.circular(random.nextInt(100).toDouble());
          });
        },
        tooltip: "cada que presiones el boton generaras una nueva figura",
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
