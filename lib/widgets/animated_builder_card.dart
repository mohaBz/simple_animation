import 'package:flutter/material.dart';

class AnimatedBuilderCard extends StatelessWidget {
  final AnimationController _animationController;
  final Animation<Size> _sizeAnimation;

  const AnimatedBuilderCard(this._animationController, this._sizeAnimation);

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
