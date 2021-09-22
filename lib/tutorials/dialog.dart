import 'dart:html';

import 'package:flutter/material.dart';

class DialogPage extends StatefulWidget {
  const DialogPage({Key? key}) : super(key: key);

  @override
  _DialogPageState createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          TextButton(
              onPressed: () async {
                return showDialog (
                    context: context,
                    barrierDismissible: false,
                    builder: (context){
                      return AlertDialog(
                        title: Text("This is title"),
                        content: Column(
                          children: [
                            Text("Are You Sure?"),
                            SizedBox(height: 4.0,),
                            Text("Delete User ?")
                          ],
                        ),
                        actions: [
                          TextButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              child: Text("Cancel")
                          ),
                          TextButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              child: Text("Delete User")
                          )
                        ],
                      );

                    }
                );
              },
              child: Text("Click Here to Open Dialog")
          )
        ],
      ),
    );
  }
}
