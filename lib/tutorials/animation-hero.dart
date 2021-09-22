import 'package:flutter/material.dart';

class HeroPageOne extends StatelessWidget {
  const HeroPageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HERO PAGE ONE"),
      ),
      body: Container(
        child: InkWell(
          child: Hero(
              tag: "my-tag",
              child: Image.network("src")
          ),
          onTap: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HeroPageTwo(),));
      },
        ),
      ),
    );
  }
}

class HeroPageTwo extends StatelessWidget {
  const HeroPageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HERO PAGE ONE"),
      ),
      body: Center(
        child: InkWell(
          child: Hero(
              tag: "my-tag",
              child: Image.network("src")
          ),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

