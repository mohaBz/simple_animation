import 'package:flutter/material.dart';

class TransitionAnimationCard extends StatefulWidget {
  @override
  _TransitionAnimationCardState createState() =>
      _TransitionAnimationCardState();
}

class _TransitionAnimationCardState extends State<TransitionAnimationCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _sizeAnimation;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _sizeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.linear));

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _sizeAnimation,
      child: GestureDetector(
        onTapDown: (_) {
          _animationController.forward();
        },
        onTapUp: (_) {
          _animationController.reverse();
        },
        child: Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          child: Text('Transition Animation'),
          height: 200,
          width: 400,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.blueGrey),
        ),
      ),
    );
  }
}
