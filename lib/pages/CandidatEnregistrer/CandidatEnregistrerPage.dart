import 'package:elections/pages/intro/introPage.dart';
import 'package:elections/utils/Colors.dart';
import 'package:elections/widgets/mainMenu.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class CandidatEnregistrerPage extends StatelessWidget {
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
              height: 5,
            ),
            _sexeField(),
            SizedBox(
              height: 5,
            ),
            _birthField(context),
            SizedBox(
              height: 5,
            ),
            _etatCivilField(),
            SizedBox(
              height: 5,
            ),
            _telField(),
            SizedBox(
              height: 5,
            ),
            _emailField(),
            SizedBox(
              height: 5,
            ),
            _levelField(),
            SizedBox(
              height: 5,
            ),
            _posteField(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  AppBar _header() {
    return AppBar(
      title: Text('Nouveau Candidat'),
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
          labelText: "Votre nom complet",
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

  Widget _sexeField() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        cursorColor: Couleurs().secondary,
        decoration: InputDecoration(
          labelText: "Votre sexe",
          floatingLabelStyle: TextStyle(color: Couleurs().secondary),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Couleurs().secondary),
          ),
        ),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Le sexe est obligatoire';
          }
        },
      ),
    );
  }

  Widget _birthField(context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        controller: datePickerController,
        readOnly: true,
        onTap: () => ShowDatePicker(context: context),
        cursorColor: Couleurs().secondary,
        decoration: InputDecoration(
          icon: Icon(Icons.calendar_month),
          labelText: "Votre date de naissance",
          floatingLabelStyle: TextStyle(color: Couleurs().secondary),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Couleurs().secondary),
          ),
        ),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'La date de naissance est obligatoire';
          }
        },
      ),
    );
  }

  Widget _etatCivilField() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        cursorColor: Couleurs().secondary,
        decoration: InputDecoration(
          labelText: "Votre etat civil",
          floatingLabelStyle: TextStyle(color: Couleurs().secondary),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Couleurs().secondary),
          ),
        ),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'L\'etat civil est obligatoire';
          }
        },
      ),
    );
  }

  Widget _telField() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        cursorColor: Couleurs().secondary,
        decoration: InputDecoration(
          icon: Icon(Icons.phone),
          labelText: "Votre numero de telephone",
          floatingLabelStyle: TextStyle(color: Couleurs().secondary),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Couleurs().secondary),
          ),
        ),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Le numero de telephone est obligatoire';
          }
        },
      ),
    );
  }

  Widget _emailField() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        cursorColor: Couleurs().secondary,
        decoration: InputDecoration(
          icon: Icon(Icons.email),
          labelText: "Votre email",
          floatingLabelStyle: TextStyle(color: Couleurs().secondary),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Couleurs().secondary),
          ),
        ),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'L\'email est obligatoire';
          }
        },
      ),
    );
  }

  Widget _levelField() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        cursorColor: Couleurs().secondary,
        decoration: InputDecoration(
          labelText: "Votre niveau d'etude",
          floatingLabelStyle: TextStyle(color: Couleurs().secondary),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Couleurs().secondary),
          ),
        ),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Le niveau d\'etude est obligatoire';
          }
        },
      ),
    );
  }

  Widget _posteField() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        cursorColor: Couleurs().secondary,
        decoration: InputDecoration(
          labelText: "Le poste",
          floatingLabelStyle: TextStyle(color: Couleurs().secondary),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Couleurs().secondary),
          ),
        ),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Le poste est obligatoire';
          }
        },
      ),
    );
  }

  TextEditingController datePickerController = TextEditingController();
  ShowDatePicker({required BuildContext context}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      lastDate: DateTime.now(),
      firstDate: DateTime(1880),
      initialDate: DateTime.now(),
    );
    if (pickedDate == null) return;
    datePickerController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
  }
}
