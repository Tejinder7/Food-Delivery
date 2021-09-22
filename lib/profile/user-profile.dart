import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/util/constants.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  //AppUser? appUser;

  /*

    Future<AppUser?> fetchUserDetails() async {
    String uid = FirebaseAuth.instance.currentUser!.uid.toString();
    DocumentSnapshot document = await FirebaseFirestore.instance.collection("users").doc(uid).get();
    appUser = AppUser();

    appUser!.uid = document.get('uid').toString();
    appUser!.name = document.get('name').toString();
    appUser!.email = document.get('email').toString();
    appUser!.imageURL = document.get('imageURL').toString();

    return appUser;
  }

  */

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        Card(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.all(8.0)),
                  InkWell(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          Util.appUser!.imageURL.toString()),
                      radius: 60.0,
                    ),
                    onTap: () {},
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  Divider(),
                  Text(Util.appUser!.name.toString(),
                      style:
                      TextStyle(color: Colors.lightBlue, fontSize: 20)),
                  Text(Util.appUser!.email.toString(),
                      style: TextStyle(color: Colors.lightBlue, fontSize: 10))
                ])),
        ListTile(
            leading: Icon(Icons.person),
            title: Text("Manage Profile"),
            subtitle: Text("Update Your Data for Your Account"),
            trailing: Icon(Icons.keyboard_arrow_right_rounded),
            onTap: () {}),
        ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text("Manage Orders"),
            subtitle: Text("Manage your Order History here"),
            trailing: Icon(Icons.keyboard_arrow_right_rounded),
            onTap: () {}),
        ListTile(
          leading: Icon(Icons.home),
          title: Text("Manage Addresses"),
          subtitle: Text("Update Your Addresses for Delivery"),
          trailing: Icon(Icons.keyboard_arrow_right_sharp),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.message),
          title: Text("Help"),
          subtitle: Text("Raise Your Queries"),
          trailing: Icon(Icons.keyboard_arrow_right_sharp),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.document_scanner_outlined),
          title: Text("Terms & Conditions"),
          subtitle: Text("Check our Terms and Conditions"),
          trailing: Icon(Icons.keyboard_arrow_right_sharp),
          onTap: () {},
        ),
      ],
    );
  }
}