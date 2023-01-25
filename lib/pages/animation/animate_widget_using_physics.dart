import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class AnimateWidgetUsingPhysics extends StatelessWidget {
  const AnimateWidgetUsingPhysics({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(title),
        ),
        body: const DraggableCard(
            child: FlutterLogo(
          size: 128,
        )));
  }
}

class DraggableCard extends StatefulWidget {
  const DraggableCard({required this.child, super.key});
  final Widget child;
  @override
  State<DraggableCard> createState() => _DraggableCardState();
}

// statefull widget extens also with SingleTickerProviderStateMixin
class _DraggableCardState extends State<DraggableCard>
    with SingleTickerProviderStateMixin {
  // animation controller
  late AnimationController _controller;
// initial position of the card's child
  Alignment _dragAligment = Alignment.center;
  // Tween to interpolate the animation
  late Animation<Alignment> _animation;
  // method to control animation and includes physics package
  void _runAnimation(Offset pixelsPerSecond, Size size) {
    _animation = _controller
        .drive(AlignmentTween(begin: _dragAligment, end: Alignment.center));
    // calculate the velocity relative to the unit interval, [0,1]
    final unitsPerSecondX = pixelsPerSecond.dx / size.width;
    final unitsPerSecondY = pixelsPerSecond.dy / size.height;
    final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
    final unitVelocity = unitsPerSecond.distance;

    const spring = SpringDescription(mass: 30, stiffness: 1, damping: 1);

    final simulation = SpringSimulation(spring,0, 1,-unitVelocity);

    _controller.animateWith(simulation);
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    // active the _runAnimation method
    _controller.addListener(() {
      setState(() {
        _dragAligment = _animation.value;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
        onPanDown: (details) {
          _controller.stop();
        },
        onPanUpdate: (details) {
          setState(() {
            _dragAligment += Alignment(details.delta.dx / (size.width / 2),
                details.delta.dx / (size.width / 2));
          });
        },
        onPanEnd: (details) {
          _runAnimation(details.velocity.pixelsPerSecond, size);
        },
        child: Align(
          // aplay the initial aligment
          alignment: _dragAligment,
          child: Card(
            child: widget.child,
          ),
        ));
  }
}
