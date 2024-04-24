import 'package:elections/pages/Home/HomePage.dart';
import 'package:elections/pages/intro/introPage.dart';
import 'package:elections/utils/Colors.dart';
import 'package:elections/utils/Logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 120,
              width: double.infinity,
            ),
            Logo().logo(null, null),
            SizedBox(
              height: 20,
            ),
            _titreText(),
            SizedBox(
              height: 50,
            ),
            _usernameField(),
            SizedBox(
              height: 10,
            ),
            _passwordField(),
            SizedBox(
              height: 50,
            ),
            _validationBtn(context),
          ],
        ),
      ),
    );
  }

  Text _titreText() {
    return Text(
      "Authentification",
      style: TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _usernameField() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: TextFormField(
        cursorColor: Couleurs().secondary,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.people),
          labelText: "Email Ou Nom d'utilisateur",
          floatingLabelStyle: TextStyle(color: Colors.black),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'L\'identifiant est obligatoire';
          }
        },
      ),
    );
  }

  Widget _passwordField() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: TextFormField(
        obscureText: true,
        cursorColor: Couleurs().secondary,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.visibility),
          labelText: "Mot de passe",
          floatingLabelStyle: TextStyle(color: Colors.black),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Le mot de passe est obligatoire';
          }
        },
      ),
    );
  }

  Widget _validationBtn(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: 120),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            elevation: 15, foregroundColor: Colors.black),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        },
        label: Text(
          "Valider",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        icon: Icon(
          Icons.send,
          size: 18,
        ),
      ),
    );
  }
}
