import 'package:flutter/material.dart';

class AnimatedBuilderCard extends StatefulWidget {
  const AnimatedBuilderCard();

  @override
  _AnimatedBuilderCardState createState() => _AnimatedBuilderCardState();
}

class _AnimatedBuilderCardState extends State<AnimatedBuilderCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Size> _sizeAnimation;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _sizeAnimation = Tween<Size>(begin: Size(100, 50), end: Size(400, 200))
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.linear));

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        _animationController.forward();
      },
      onTapUp: (_) {
        _animationController.reverse();
      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (ctx, text) {
          return Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: text,
            height: _sizeAnimation.value.height,
            width: _sizeAnimation.value.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blueGrey),
          );
        },
        child: Text('AnimatedBuilder'),
      ),
    );
  }
}
