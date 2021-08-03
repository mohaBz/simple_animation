import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AnimatedContainerCard extends StatefulWidget {
  const AnimatedContainerCard({Key? key}) : super(key: key);

  @override
  _AnimatedContainerCardState createState() => _AnimatedContainerCardState();
}

class _AnimatedContainerCardState extends State<AnimatedContainerCard> {
  bool _expanded = false;
  void _tabDown() {
    setState(() {
      _expanded = true;
    });
  }

  void _tabUp() {
    setState(() {
      _expanded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        _tabDown();
      },
      onTapUp: (_) {
        _tabUp();
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
        height: _expanded ? 200 : 50,
        width: _expanded ? 400 : 100,
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Text('Manualy managed Animation'),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: _expanded ? Colors.green : Colors.redAccent,
        ),
      ),
    );
  }
}
