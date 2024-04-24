import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PagePrime extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor:Colors.red,
      body:Column(
          crossAxisAlignment:CrossAxisAlignment.center,
          children:[
            SizedBox(height: 40),
            Text("LA PAGE DE PRIME"),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText:'Montant',
              ),
            ),
            SizedBox(height:20),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText:'Type',
              ),
            ),
            SizedBox(height:20),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText:'Date du debut',
              ),
            ),
            SizedBox(height:20),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText:'Date de fin',
              ),
            ),
            SizedBox(height:20),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText:'Devise',
              ),
            ),
            SizedBox(height:50),
            SizedBox(
              width:200,
              height:50,
              child:ElevatedButton(
                  onPressed:(){},
                  child:Text("Valider"),
                  style:ElevatedButton.styleFrom(backgroundColor:Colors.green,foregroundColor:Colors.white)
              ),
            ),
          ]
      ),
    );
  }

}