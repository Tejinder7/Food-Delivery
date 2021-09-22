import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/pages/dishes-page.dart';


class RestaurantsPage extends StatefulWidget {
  const RestaurantsPage({Key? key}) : super(key: key);

  @override
  _RestaurantsPageState createState() => _RestaurantsPageState();
}

class _RestaurantsPageState extends State<RestaurantsPage> {

  fetchRestaurants(){
    // Stream is a Collection i.e. a List of QuerySnapshot
    // QuerySnapshot is our Document :)
    Stream<QuerySnapshot> stream = FirebaseFirestore.instance.collection('restaurants').snapshots();
    return stream;
  }


  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
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

        //List data = [10, 20, 30];
        //List data1 = data.map((e) => e+10).toList();

        /*List<DocumentSnapshot> snapshots = snapshot.data!.docs;
          List<ListTile> tiles = [];
          snapshots.forEach((document) {
            Map<String, dynamic> map = document.data()! as Map<String, dynamic>;
            tiles.add(
                ListTile(
                  title: Text(map['name']),
                  subtitle: Text(map['categories']), +
                )
            )
          });*/

        return ListView(
            padding: EdgeInsets.all(8),
            children: snapshot.data!.docs.map<Widget>((DocumentSnapshot document){
              //document.id -> Restaurant Document ID
              Map<String, dynamic> map = document.data()! as Map<String, dynamic>;

              return InkWell(
                child: Card(
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
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
                                  children:[
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(map['name'], style: TextStyle(fontSize: 18),),
                                        SizedBox(height: 2,),
                                        Text(map['categories'], style: TextStyle(fontSize: 12, color: Colors.black45),),
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      children: [
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
                                        Container(
                                          padding: EdgeInsets.all(6.0),
                                          child: Text("\u20b9"+ map['pricePerPerson'].toString()+" for one", style: TextStyle(color: Colors.grey),),
                                        ),
                                      ],
                                    )

                                  ]
                              ),
                              Divider(),
                              SizedBox(height: 10,)
                            ],
                          ),
                        ),
                      ],
                    )
                ),
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DishesPage(restaurantId: document.id,))
                  );
                },
              );
            }).toList()
        );

      },
    );
  }
}