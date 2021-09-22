import 'dart:math';

import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {

  Color color= Colors.green;
  double borderRadius= 2;
  double margin= 2;

  void updateAttributes (){
    color= Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
    borderRadius= Random().nextDouble() * 64;
    margin= Random().nextDouble() * 64;
  }

  @override
  void initState(){
    super.initState();
  }

  void animateContainer(){
    setState(() {
      updateAttributes();
    });
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animations Introduction"),
      ),
      body: Center(
        child: Column(
          children: [
            AnimatedContainer(
              width: 256,
              height: 256,
              duration: Duration(milliseconds: 1000),
              margin: EdgeInsets.all(margin),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
            SizedBox(height: 24,),
            TextButton(
                onPressed: (){
                    animateContainer();
                },
                child: Text("ANIMATE CONTAINER"))
          ],
        ),
      ),
    );
  }
}
