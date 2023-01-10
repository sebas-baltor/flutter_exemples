import "package:flutter/material.dart";

class FadeWidgetInOut extends StatefulWidget {
  const FadeWidgetInOut({super.key, required this.title});
  final String title;

  @override
  State<FadeWidgetInOut> createState() => _FadeWidgetInOutState();
}

class _FadeWidgetInOutState extends State<FadeWidgetInOut> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: AnimatedOpacity(
        opacity: _visible ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.bounceInOut,
        child: Container(
          width: 200.0,
          height: 200.0,
          color: Colors.green,
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _visible = !_visible;
          });
        },
        tooltip: "activar animacion",
        child: const Icon(Icons.flip),
      ),
    );
  }
}
