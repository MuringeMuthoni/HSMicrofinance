import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AndroidFirstPage extends StatelessWidget {
  // const AndroidFirstPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 20,
        padding: EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(20),
            child: Text("Android $index"),
          );
        });
  }
}
