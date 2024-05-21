import 'package:elections/pages/intro/introPage.dart';
import 'package:elections/utils/Colors.dart';
import 'package:elections/widgets/datePicker.dart';
import 'package:flutter/material.dart';

class MissionEnregistrerPage extends StatefulWidget {
  @override
  MyFormState createState() => MyFormState();
}

class MyFormState extends State<MissionEnregistrerPage> {
  final _formKey = GlobalKey<FormState>();
  final nom = TextEditingController();
  final dateCreate = TextEditingController();

  @override
  void dispose() {
    nom.dispose();
    dateCreate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _header(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
              _startDateField(context),
              SizedBox(
                height: 10,
              ),
              _endDateField(context),
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
      ),
    );
  }

  AppBar _header() {
    return AppBar(
      title: Text('Nouvelle Mission'),
      actions: [
        IconButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Enregistrement reussi'),
                ),
              );
            }
          },
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

  Widget _startDateField(context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        controller: datePickerController,
        readOnly: true,
        onTap: () => ShowDatePicker(context: context),
        cursorColor: Couleurs().secondary,
        decoration: InputDecoration(
          icon: Icon(Icons.calendar_month),
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

    Widget _endDateField(context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        controller: datePickerController,
        readOnly: true,
        onTap: () => ShowDatePicker(context: context),
        cursorColor: Couleurs().secondary,
        decoration: InputDecoration(
          icon: Icon(Icons.calendar_month),
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
