import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled/pages/restaurants-page.dart';
import 'package:untitled/profile/user-profile.dart';
import 'package:untitled/util/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int index= 0;

  List <Widget> widgets =[
    RestaurantsPage(),
    Center( child: Text("SEARCH")),
    UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Util.APP_NAME),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pushReplacementNamed(context, "/cart");
            }, icon: Icon(Icons.shopping_cart),
            tooltip: "Cart",

          ),
          IconButton(
            onPressed: (){
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, "/login");
            }, icon: Icon(Icons.logout),
            tooltip: "Log Out",

          )
        ],
      ),

      body: widgets[index],

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "HOME"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "SEARCH"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: "PROFILE"
          )
        ],

        currentIndex: index,
        selectedFontSize: 16,
        selectedItemColor: Colors.green,
        onTap: (idx){ //idx will have the value of the index of bottomNavBar item
          setState(() {
            index=idx;
          });
        },
      ),
    );
  }
}
