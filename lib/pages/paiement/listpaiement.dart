import 'package:elections/pages/paiement/listpaiementCtrl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListPaiement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          title: Text("Liste de paiement des agents"),
          backgroundColor:Colors.deepPurple[900],
          foregroundColor:Colors.white,),
        //drawer:_menuListPresence(),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal:20),
            child:ListView.builder(
                itemCount: ListPaiementCtrl().get().length,
                prototypeItem: ListTile(
                  title: Text( ListPaiementCtrl().get().first.ref),
                ),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("$index. "+ ListPaiementCtrl().get()[index].ref),
                  );
                }
            )
        )
    );
  }
}