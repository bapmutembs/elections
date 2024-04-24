import 'package:flutter/material.dart';

import '../introPage/introPage.dart';
import '../offre/offreList.dart';

var DateFormat;
//var formatterDate;

class OffreEmploiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            _logo(),
            SizedBox(height: 10),
            _titreText(),
            //sizebox
            SizedBox(height: 20),
            _descriptionField(),
            SizedBox(height: 20),
            //sizebox
            _tacheField(),
            SizedBox(height: 20),
            _dateDebutField(),
            SizedBox(height: 20),
            _dateFinField(),
            SizedBox(height: 20),
            _PosteField(),
            SizedBox(height: 20),
            _validationBtn(context),
            SizedBox(height: 20),
            _quitterBtn(context)
          ],
        ),
      ),
    );
  }

  //////////////////zoner
  Widget _logo() {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: Image.network(
          "https://cdn-icons-png.freepik.com/256/8958/8958915.png?uid=R145984515&ga=GA1.1.1885357410.1713772453&semt=ais_hybrid",
          width: 45),
    );
  } //logo

//text
  Widget _titreText() {
    return Text("Formulaire de l'offre d'emploi");
  } // text

  Widget _PosteField() {
    return TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Poste',
            prefixIcon: Icon(Icons.search)));
  } //Textf

  Widget _validationBtn(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 50),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (ctx) => OffrePage()));
      },
      icon: Icon(Icons.check),
      label: const Text('Envoyer',
          style: TextStyle(
            fontSize: 15,
          )),
    );
  } // Button

  Widget _quitterBtn(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 50),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (ctx) => IntroPage()));
      },
      icon: Icon(Icons.close),
      label: const Text('Quitter',
          style: TextStyle(
            fontSize: 15,
          )),
    );
  } // Button

  Widget _descriptionField() {
    return TextField(

        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Description du poste',
          prefixIcon: Icon(Icons.description),
          //suffixIcon: Icon(Icons.visibility)
        ));
  } //pass

  Widget _tacheField() {
    return TextField(

        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Tache',
          prefixIcon: Icon(Icons.work),
          //suffixIcon: Icon(Icons.visibility)
        ));
  } //pass

  Widget _dateDebutField() {
    return TextField(

        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Date du debut',
          prefixIcon: Icon(Icons.calendar_month),
          //suffixIcon: Icon(Icons.visibility)
        ));
  } //pass

  Widget _dateFinField() {
    return TextField(

        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Date de fin',
          prefixIcon: Icon(Icons.calendar_month),
          //suffixIcon: Icon(Icons.visibility)
        ));
  } //pass
} //fin
