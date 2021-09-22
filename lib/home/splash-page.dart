import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled/model/user.dart';
import 'package:untitled/util/constants.dart';

class SplashPage extends StatelessWidget {

  static fetchUserDetails() async {
    String uid = await FirebaseAuth.instance.currentUser!.uid.toString();
    if (uid != null) {
      DocumentSnapshot document = await FirebaseFirestore.instance.collection(
          Util.USERS_COLLECTION).doc(uid).get();

      Util.appUser = AppUser();

      Util.appUser!.uid = document.get('uid').toString();
      Util.appUser!.name = document.get('name').toString();
      Util.appUser!.email = document.get('email').toString();
      Util.appUser!.imageURL = document.get('imageURL').toString();
    }
  }

  navigateToFetchLocation(BuildContext context){
    Future.delayed(
        Duration(seconds: 3),
            (){
          Navigator.pushReplacementNamed(context, "/location-tutorial");
        }
    );
  }

  navigateToHome(BuildContext context){

    User? user = FirebaseAuth.instance.currentUser;

    Future.delayed(
        Duration(seconds: 3),
            (){
          //Navigator.pushNamed(context, "/home");
          if(user != null){
            String uid = FirebaseAuth.instance.currentUser!.uid;
            if(uid== "h6ja1vZ2SUQgRZvCcfwW0PRrl5c2"){
              Navigator.pushReplacementNamed(context, "/addrest");
            }
            else{
              Navigator.pushReplacementNamed(context, "/home");
            }
          }else {
            Navigator.pushReplacementNamed(context, "/login");
          }
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    fetchUserDetails();
    navigateToHome(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("food.png"),
            SizedBox(
              height: 8,
            ),
            Text("Foodie", style: TextStyle(color: Colors.lightBlue, fontSize: 16),),
            Text("We Deliver Fresh", style: TextStyle(color: Colors.orangeAccent, fontSize: 12),)
          ],
        ),
      ),

    );
  }
}
