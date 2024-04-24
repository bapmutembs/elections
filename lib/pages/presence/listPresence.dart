import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'listPresenceCtrl.dart';

class ListPresence extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar:AppBar(
        title: Text("Liste de presence des agents"),
          backgroundColor:Colors.deepPurple[900],
          foregroundColor:Colors.white,),
    //drawer:_menuListPresence(),
    body: Padding(
    padding: EdgeInsets.symmetric(horizontal:20),
    child:ListView.builder(
    itemCount: ListPresenceCtrl().get().length,
    prototypeItem: ListTile(
    title: Text(ListPresenceCtrl().get().first.nom),
    ),
    itemBuilder: (context, index) {
    return ListTile(
    title: Text("$index. "+ListPresenceCtrl().get()[index].nom),
    );
    }
    )
    )
    );
  }
}



