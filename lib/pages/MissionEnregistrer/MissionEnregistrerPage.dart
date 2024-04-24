import 'package:elections/pages/intro/introPage.dart';
import 'package:elections/utils/Colors.dart';
import 'package:flutter/material.dart';

class MissionEnregistrerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _header(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
            ),
            _nameField(),
            SizedBox(
              height: 10,
            ),
            _lieuField(),
            SizedBox(
              height: 10,
            ),
            _startDateField(),
            SizedBox(
              height: 10,
            ),
            _endDateField(),
            SizedBox(
              height: 10,
            ),
            _objectifField(),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  AppBar _header() {
    return AppBar(
      title: Text('Nouvelle Mission'),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.send),
        ),
      ],
    );
  }

  Widget _nameField() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        cursorColor: Couleurs().secondary,
        decoration: InputDecoration(
          labelText: "Saisir le nom de l'agent",
          floatingLabelStyle: TextStyle(color: Couleurs().secondary),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Couleurs().secondary),
          ),
        ),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Le nom est obligatoire';
          }
        },
      ),
    );
  }

  Widget _lieuField() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        cursorColor: Couleurs().secondary,
        decoration: InputDecoration(
          labelText: "Saisir le lieu de la mission",
          floatingLabelStyle: TextStyle(color: Couleurs().secondary),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Couleurs().secondary),
          ),
        ),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Le lieu est obligatoire';
          }
        },
      ),
    );
  }

  Widget _startDateField() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        cursorColor: Couleurs().secondary,
        decoration: InputDecoration(
          labelText: "Saisir la date de debut",
          floatingLabelStyle: TextStyle(color: Couleurs().secondary),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Couleurs().secondary),
          ),
        ),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'La date de debut est obligatoire';
          }
        },
      ),
    );
  }

  Widget _endDateField() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        cursorColor: Couleurs().secondary,
        decoration: InputDecoration(
          labelText: "Saisir la date de fin",
          floatingLabelStyle: TextStyle(color: Couleurs().secondary),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Couleurs().secondary),
          ),
        ),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'La date de fin est obligatoire';
          }
        },
      ),
    );
  }

  Widget _objectifField() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        cursorColor: Couleurs().secondary,
        decoration: InputDecoration(
          labelText: "Saisir l'objectif de la mission",
          floatingLabelStyle: TextStyle(color: Couleurs().secondary),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Couleurs().secondary),
          ),
        ),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'L\'objectif est obligatoire';
          }
        },
      ),
    );
  }
}
