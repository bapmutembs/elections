import 'package:elections/departement/business/model/departement/Departement.dart';
import 'package:elections/departement/ui/pages/DepartementEnregistrer/DepartementEnregistrerController.dart';
import 'package:elections/departement/ui/pages/DepartementList/DepartementListControlleur.dart';
import 'package:elections/pages/intro/introPage.dart';
import 'package:elections/utils/Colors.dart';
import 'package:elections/widgets/datePicker.dart';
import 'package:flutter/material.dart';

class DepartementEnregistrerPage extends StatefulWidget {
  @override
  MyFormState createState() => MyFormState();
}

class MyFormState extends State<DepartementEnregistrerPage> {
  final _formKey = GlobalKey<FormState>();
  //final myController = ;
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
      body: ListView(
        children: [
          Form(
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
                _dateCreateField(context),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar _header() {
    return AppBar(
      title: Text('Nouveau Departement'),
      actions: [
        IconButton(
          onPressed: () async {
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
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: nom,
        cursorColor: Couleurs().secondary,
        decoration: InputDecoration(
          labelText: "Saisir le nom du departement",
          floatingLabelStyle: TextStyle(color: Couleurs().secondary),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Couleurs().secondary),
          ),
        ),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Le nom est obligatoire';
          }
          return null;
        },
      ),
    );
  }

  Widget _dateCreateField(context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        controller: datePickerController,
        readOnly: true,
        onTap: () => ShowDatePicker(context: context),
        cursorColor: Couleurs().secondary,
        decoration: InputDecoration(
          icon: Icon(Icons.calendar_month),
          labelText: "Saisir la date de creation",
          floatingLabelStyle: TextStyle(color: Couleurs().secondary),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Couleurs().secondary),
          ),
        ),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'La date de creation est obligatoire';
          }
        },
      ),
    );
  }
}
