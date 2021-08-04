import 'package:flutter/material.dart';
import 'package:simple_animation/widgets/animated_builder_card.dart';
import 'package:simple_animation/widgets/animated_container_card.dart';
import 'package:simple_animation/widgets/manually_managed_card.dart';
import 'package:simple_animation/widgets/transition_animation_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ManuallyManagedCard(),
              SizedBox(
                height: 20,
              ),
              AnimatedBuilderCard(),
              SizedBox(
                height: 20,
              ),
              AnimatedContainerCard(),
              SizedBox(
                height: 20,
              ),
              TransitionAnimationCard()
            ],
          ),
        ),
      ),
    );
  }
}
