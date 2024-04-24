import 'package:elections/pages/paiement/listpaiement.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PagePaiement extends StatelessWidget {  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     body:Padding (
       padding: EdgeInsets.symmetric(horizontal:50),
    child:ListView(
  children:[
    //margin:EdgeInsets.symmetric(horizontal:50),
     SizedBox(height:80),
    Text("Paiement des agents", style:TextStyle(fontSize:30,color:Colors.blue,fontWeight: FontWeight.bold)),
    SizedBox(height:30),
    //https://as1.ftcdn.net/v2/jpg/03/89/01/10/1000_F_389011077_TK6ExJo1QIBlLDCyN7nBNgvbakfEZW6s.jpg
    TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText:"reference",
        )
    ),
    SizedBox(height:10),
    TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "information agent",
        )
    ),
    SizedBox(height:10),
    TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "montant",
        )
    ),
    SizedBox(height:10),
    TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "devise",
        )
    ),
    SizedBox(height:10),
    TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "due",
        )
    ),
    SizedBox(height:10),
    TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "modalite",
        )
    ),
    SizedBox(height:10),
    TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "type de paiement",
        )
    ),
    SizedBox(height:10),
    TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "date de paiement",
        )
    ),
    SizedBox(height:20),
    SizedBox(
      height:50,
      child:ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue[900],
        padding: EdgeInsets.symmetric(horizontal: 60),
      ),
      onPressed: () {Navigator.push(context, MaterialPageRoute(builder:(ctx)=>ListPaiement()));},
      icon:Icon(Icons.check),
      label: const Text('Connexion', style: TextStyle(color: Colors.white, fontSize: 10,fontWeight: FontWeight.bold),
      ),
    ),
    ),
  ],


)
     )
   );
  }
}
