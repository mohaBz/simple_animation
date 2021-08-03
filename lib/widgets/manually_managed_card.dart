import 'package:flutter/material.dart';

class ManuallyManagedCard extends StatefulWidget {
  const ManuallyManagedCard({Key? key}) : super(key: key);

  @override
  _ManuallyManagedCardState createState() => _ManuallyManagedCardState();
}

class _ManuallyManagedCardState extends State<ManuallyManagedCard>
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
    // this is used when manually managing the animation
    _sizeAnimation.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    // this is used when manually managing the animation
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
      child: Container(
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Text('Manualy managed Animation'),
        height: _sizeAnimation.value.height,
        width: _sizeAnimation.value.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.blueGrey),
      ),
    );
  }
}
