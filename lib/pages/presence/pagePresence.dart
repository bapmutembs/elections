import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'listPresence.dart';

class PagePresence extends StatelessWidget{
  final _formKey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

   return Scaffold(
       backgroundColor:Colors.blue[50],
      body:Padding(
        padding: EdgeInsets.symmetric(horizontal:20),
          child: ListView(
          children:[
            SizedBox(height:80),
            SizedBox(
              child: Text("Presence des agents",
                  style:TextStyle(fontSize:25,color:Colors.blue[900],fontWeight: FontWeight.bold,)),
            ),
            SizedBox(height:10),
              SizedBox(height:20),
            TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:"Identifiant",
                )
            ),
            SizedBox(height:10),
            TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Information sur agent",
                )
            ),
            SizedBox(height:10),
            TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Heure d'arrivée",
                )
            ),
            SizedBox(height:10),
            TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Heure du depart",
                )
            ),
            SizedBox(height:10),
            TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Date d'arrivée",


                )
            ),

            SizedBox(height:10),
            TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Date du depart",
                )
            ),

            SizedBox(height:20),
            SizedBox(
              height:50,
              child:ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900],
                  padding: EdgeInsets.symmetric(horizontal: 60),
                ),
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder:(ctx)=>ListPresence()));},

                child: const Text('Valider', style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ]
      ),
    )
   );

  }

}