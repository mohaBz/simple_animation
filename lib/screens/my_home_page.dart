import 'package:flutter/material.dart';
import 'package:simple_animation/widgets/animated_builder_card.dart';
import 'package:simple_animation/widgets/animated_container_card.dart';
import 'package:simple_animation/widgets/manually_managed_card.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ManuallyManagedCard(),
            SizedBox(
              height: 20,
            ),
            AnimatedBuilderCard(_animationController, _sizeAnimation),
            SizedBox(
              height: 20,
            ),
            AnimatedContainerCard()
          ],
        ),
      ),
    );
  }
}
