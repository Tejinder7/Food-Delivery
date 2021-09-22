import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled/custom-widgets/counter.dart';
import 'package:untitled/util/constants.dart';


class DishesPage extends StatefulWidget {

  String? restaurantId;

  DishesPage({Key? key, this.restaurantId}) : super(key: key);

  @override
  _DishesPageState createState() => _DishesPageState();
}

class _DishesPageState extends State<DishesPage> {

  fetchRestaurants(){
    // Stream is a Collection i.e. a List of QuerySnapshot
    // QuerySnapshot is our Document :)
    Stream<QuerySnapshot> stream = FirebaseFirestore.instance.collection(Util.RESTAURANT_COLLECTION)
        .doc(widget.restaurantId).collection(Util.DISHES_COLLECTION).snapshots();
    return stream;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Locale.locale['appTitle'].toString()),
          actions: [
            IconButton(
              onPressed: (){
                Navigator.pushReplacementNamed(context, "/cart");
              }, icon: Icon(Icons.shopping_cart),
              tooltip: "Cart",
            ),
          ],
        ),
        body: StreamBuilder(
          stream: fetchRestaurants(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {

            if(snapshot.hasError){
              return Center(
                child: Text("SOMETHING WENT WRONG", style: TextStyle(color: Colors.red),),
              );
            }

            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView(
                padding: EdgeInsets.all(16),
                children: snapshot.data!.docs.map<Widget>((DocumentSnapshot document){
                  //document.id -> Restaurant Document ID
                  Map<String, dynamic> map = document.data()! as Map<String, dynamic>;
                  map['docId'] = document.id.toString();

                  List category = map['category'];
                  String categories = "";
                  category.forEach((element) {
                    categories += element.toString()+", ";
                  });

                  categories = categories.substring(0, categories.length-2);

                  return Card(
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15)),
                          child: Image.network(map['imageURL'].toString()),
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(map['name'], style: TextStyle(fontSize: 18),),
                                      SizedBox(height: 2.0,),
                                      Text(categories, style: TextStyle(fontSize: 12, color: Colors.black45),),
                                    ],
                                  ),
                                  Spacer(),
                                  Container(
                                    padding: EdgeInsets.all(6.0),
                                    child: Row(
                                      children: [
                                        Text(map['ratings'].toString(), style: TextStyle(color: Colors.white),),
                                        Icon(Icons.star, color: Colors.white, size:15 ,),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(8.0)
                                    ),
                                  ),
                                ],
                              ),
                              Divider(),
                              Row(
                                children: [
                                  Text("Price \u20b9"+map['price'].toString(), style: TextStyle(color: Colors.black87, fontSize: 16),),
                                  Spacer(),
                                  Counter(dish: map,),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                  );
                }).toList()
            );

          },
        )
    );
  }
}