import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled/model/restaurants.dart';

class AddRestaurant extends StatefulWidget {
  const AddRestaurant({Key? key}) : super(key: key);

  @override
  _AddRestaurantState createState() => _AddRestaurantState();
}

class _AddRestaurantState extends State<AddRestaurant> {

  void Restaurant_add(BuildContext context) async{

    User? user = FirebaseAuth.instance.currentUser;

      if(user != null){

        Restaurant restaurant = Restaurant(name:rnameController.text.trim(), categories:categoriesController.text.trim(),pricePerPerson:int.parse(priceperpersonController.text.trim()), ratings: double.parse(ratingsController.text.trim()));
        var dataToSave = restaurant.toMap();

        FirebaseFirestore.instance.collection("restaurants").doc().set(dataToSave).then((value) => Navigator.pushReplacementNamed(context, "/"));

        //Navigator.pushReplacementNamed(context, "/home");
      }else{
        // Registration Failed
        setState(() {
          showLoader=false;
          // Show a SnackBar | It will have a message (Login Failed)
          // SnackBar() -> this is a widget which shows and goes off after some time
        });
      }


    }

  TextEditingController rnameController = new TextEditingController();
  TextEditingController categoriesController = new TextEditingController();
  TextEditingController priceperpersonController = new TextEditingController();
  TextEditingController ratingsController = new TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool showLoader = false;

  @override
  Widget build(BuildContext context) {
    return showLoader ? Center(child: CircularProgressIndicator(),) : Scaffold(
        appBar: AppBar(
          title: Text("Foodie"),
          actions: [
            IconButton(
              onPressed: (){
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, "/login");
              }, icon: Icon(Icons.logout),
              tooltip: "Log Out",

            )
          ],
        ),
        body: Stack(
          children: [
            Column(children: [
              Expanded(
                child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: <Color>[
                          Color(0xff7aff7e),
                          Color(0xff03af0f),
                        ],
                        tileMode:
                        TileMode.clamp, // repeats the gradient over the canvas
                      ),
                    )),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                color: Colors.white,
              )
            ]),
            Align(
              alignment: Alignment.center,
              child: Card(
                margin: EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Container(
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(16.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset("assets/food.png", fit: BoxFit.fill),
                            SizedBox(height: 4,),
                            Text(
                              "Add Restaurant",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.green,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 12),
                            TextFormField(
                              controller: rnameController,
                              style: TextStyle(
                                  fontSize: 17.0, color: Colors.grey.shade900),
                              keyboardType: TextInputType.text,
                              textCapitalization: TextCapitalization.words,
                              autofocus: false,
                              enabled: true,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Name is required. Please Enter.';
                                } else if (value.trim().length == 0) {
                                  return 'Name is required. Please Enter.';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                filled: true,
                                alignLabelWithHint: true,
                                labelText: "Restaurant\'s Name",
                                labelStyle: TextStyle(color: Colors.green),
                                fillColor: Colors.transparent,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                    borderSide: BorderSide(
                                        width: 1,
                                        style: BorderStyle.solid,
                                        color: Colors.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                    borderSide: BorderSide(
                                        width: 1,
                                        style: BorderStyle.solid,
                                        color: Colors.black)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                    borderSide: BorderSide(
                                        width: 1,
                                        style: BorderStyle.solid,
                                        color: Colors.red)),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                    borderSide: BorderSide(
                                        width: 1,
                                        style: BorderStyle.solid,
                                        color: Colors.grey)),
                                border: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                    borderSide: BorderSide(
                                        width: 1,
                                        style: BorderStyle.solid,
                                        color: Colors.grey)),
                                contentPadding:
                                new EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
                              ),
                            ),
                            SizedBox(height: 8),
                            TextFormField(
                              controller: categoriesController,
                              style: TextStyle(
                                  fontSize: 17.0, color: Colors.grey.shade900),
                              keyboardType: TextInputType.text,
                              textCapitalization: TextCapitalization.words,
                              autofocus: false,
                              enabled: true,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Categories are required. Please Enter.';
                                } else if (value.trim().length == 0) {
                                  return 'Categories required. Please Enter.';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                filled: true,
                                alignLabelWithHint: true,
                                labelText: "Categories",
                                labelStyle: TextStyle(color: Colors.green),
                                fillColor: Colors.transparent,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                    borderSide: BorderSide(
                                        width: 1,
                                        style: BorderStyle.solid,
                                        color: Colors.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                    borderSide: BorderSide(
                                        width: 1,
                                        style: BorderStyle.solid,
                                        color: Colors.black)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                    borderSide: BorderSide(
                                        width: 1,
                                        style: BorderStyle.solid,
                                        color: Colors.red)),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                    borderSide: BorderSide(
                                        width: 1,
                                        style: BorderStyle.solid,
                                        color: Colors.grey)),
                                border: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                    borderSide: BorderSide(
                                        width: 1,
                                        style: BorderStyle.solid,
                                        color: Colors.grey)),
                                contentPadding:
                                new EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
                              ),
                            ),
                            SizedBox(height: 8),
                            TextFormField(
                              controller: priceperpersonController,
                              style: TextStyle(
                                  fontSize: 17.0, color: Colors.grey.shade900),
                              keyboardType: TextInputType.phone,
                              autofocus: false,
                              enabled: true,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Price is required. Please Enter.';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  filled: true,
                                  alignLabelWithHint: true,
                                  labelText: "Price per Person",
                                  labelStyle: TextStyle(color: Colors.green),
                                  fillColor: Colors.transparent,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                      borderSide: BorderSide(
                                          width: 1,
                                          style: BorderStyle.solid,
                                          color: Colors.grey)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                      borderSide: BorderSide(
                                          width: 1,
                                          style: BorderStyle.solid,
                                          color: Colors.black)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                      borderSide: BorderSide(
                                          width: 1,
                                          style: BorderStyle.solid,
                                          color: Colors.red)),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                      borderSide: BorderSide(
                                          width: 1,
                                          style: BorderStyle.solid,
                                          color: Colors.grey)),
                                  border: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                      borderSide: BorderSide(
                                          width: 1,
                                          style: BorderStyle.solid,
                                          color: Colors.grey)),
                                  contentPadding:
                                  new EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
                                  ),
                            ),
                            TextFormField(
                              controller: ratingsController,
                              style: TextStyle(
                                  fontSize: 17.0, color: Colors.grey.shade900),
                              keyboardType: TextInputType.text,
                              autofocus: false,
                              enabled: true,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Ratings are required. Please Enter.';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                filled: true,
                                alignLabelWithHint: true,
                                labelText: "Ratings",
                                labelStyle: TextStyle(color: Colors.green),
                                fillColor: Colors.transparent,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                    borderSide: BorderSide(
                                        width: 1,
                                        style: BorderStyle.solid,
                                        color: Colors.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                    borderSide: BorderSide(
                                        width: 1,
                                        style: BorderStyle.solid,
                                        color: Colors.black)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                    borderSide: BorderSide(
                                        width: 1,
                                        style: BorderStyle.solid,
                                        color: Colors.red)),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                    borderSide: BorderSide(
                                        width: 1,
                                        style: BorderStyle.solid,
                                        color: Colors.grey)),
                                border: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                    borderSide: BorderSide(
                                        width: 1,
                                        style: BorderStyle.solid,
                                        color: Colors.grey)),
                                contentPadding:
                                new EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
                              ),
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(top: 10, bottom: 4),
                                child: TextButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() {
                                        showLoader = true;
                                        Restaurant_add(context);
                                      });

                                    }
                                  },
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    elevation: 10,
                                  ),
                                  child: Text(
                                    'Add Restaurant',
                                    style: TextStyle(
                                        fontSize: 16.0, color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                          ],
                        ),
                      )),
                ),
              ),
            ),
          ],
        ));  }
}