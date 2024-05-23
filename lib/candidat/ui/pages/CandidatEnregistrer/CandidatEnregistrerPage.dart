import 'package:elections/candidat/business/model/candidat/CreateCandidatRequest.dart';
import 'package:elections/candidat/ui/pages/CandidatEnregistrer/CandidatEnregistrerController.dart';
import 'package:elections/utils/Colors.dart';
import 'package:elections/widgets/datePicker.dart';
import 'package:elections/widgets/selectField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CandidatEnregistrerPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      MyCandidateEnregistrerState();
}

class MyCandidateEnregistrerState
    extends ConsumerState<CandidatEnregistrerPage> {
  String _selectedEtatCivil = '';
  String _selectedSexe = '';
  final _formKey = GlobalKey<FormState>();
  var name = TextEditingController();
  var poste = TextEditingController();
  var phone = TextEditingController();
  var email = TextEditingController();
  var niveauEtude = TextEditingController();
  final List<String> _etatCivils = ['Celibataire', 'Marie', 'Divorce'];
  final List<String> _sexes = ['Masculin', 'Feminin'];

  @override
  void dispose() {
    super.dispose();
    name.dispose();
    poste.dispose();
    phone.dispose();
    email.dispose();
    niveauEtude.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var state = this.ref.watch(candidatEnregistrerControllerProvider);

    return Scaffold(
      appBar: _header(context, this.ref),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 5,
              ),
              if (state.isLoading)
                LoadingAnimationWidget.twistingDots(
                    leftDotColor: Couleurs().primary,
                    rightDotColor: Couleurs().secondary,
                    size: 50),
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
      ),
    );
  }

  AppBar _header(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text('Nouveau Candidat'),
      actions: [
        IconButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              print(email.text);
              var ctrl =
                  ref.read(candidatEnregistrerControllerProvider.notifier);
              var createCandidatRequest = CreateCandidatRequest(
                nomComplet: name.text,
                sexe: _selectedSexe,
                dateNaissance: datePickerController.text,
                etatCivil: _selectedEtatCivil,
                telephone: phone.text,
                email: email.text,
                niveauEtude: niveauEtude.text,
                poste: poste.text,
              );
              var res = await ctrl.submitForm(createCandidatRequest);
              if (res) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Enregistrement reussi'),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Enregistrement echoue'),
                  ),
                );
              }
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
        controller: name,
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
      child: AutocompleteTextField(
        items: _sexes,
        decoration: InputDecoration(
          floatingLabelStyle: TextStyle(color: Couleurs().secondary),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Couleurs().secondary),
          ),
          labelText: 'Selectionner le sexe',
        ),
        validator: (val) {
          if (_sexes.contains(val)) {
            return null;
          } else {
            return 'Sexe obligatoire';
          }
        },
        onItemSelect: (selected) {
          setState(() {
            _selectedSexe = selected;
          });
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
      child: AutocompleteTextField(
        items: _etatCivils,
        decoration: InputDecoration(
          icon: Icon(Icons.assignment_ind_sharp),
          floatingLabelStyle: TextStyle(color: Couleurs().secondary),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Couleurs().secondary),
          ),
          labelText: 'Selectionner l\'etat civil',
        ),
        validator: (val) {
          if (_etatCivils.contains(val)) {
            return null;
          } else {
            return 'Etat civil obligatoire';
          }
        },
        onItemSelect: (selected) {
          setState(() {
            _selectedEtatCivil = selected;
          });
        },
      ),
    );
  }

  Widget _telField() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        controller: phone,
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
        controller: email,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        cursorColor: Couleurs().secondary,
        decoration: InputDecoration(
          icon: Icon(Icons.email),
          labelText: "Votre email",
          floatingLabelStyle: TextStyle(color: Couleurs().secondary),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Couleurs().secondary),
          ),
        ),
        autofillHints: [AutofillHints.email],
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
        controller: niveauEtude,
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
        controller: poste,
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
}
