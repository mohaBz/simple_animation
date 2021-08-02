import 'package:flutter/material.dart';

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
    // this is used when manually managing the animation
    // _sizeAnimation.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    // this is used when manually managing the animation
    // _animationController.dispose();
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
            GestureDetector(
              // onTapDown: (_) {
              //   _animationController.forward();
              // },
              // onTapUp: (_) {
              //   _animationController.reverse();
              // },
              child: Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Text('Manualy managed Animation'),
                height: 50, //_sizeAnimation.value.height,
                width: 100, //_sizeAnimation.value.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blueGrey),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
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
            ),
          ],
        ),
      ),
    );
  }
}
