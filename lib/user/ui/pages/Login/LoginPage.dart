import 'package:elections/user/business/model/user/AuthenticateUserRequest.dart';
import 'package:elections/user/ui/pages/Login/LoginController.dart';
import 'package:elections/utils/Colors.dart';
import 'package:elections/utils/Logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => MyState();
}

class MyState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  var _login = TextEditingController();
  var _password = TextEditingController();
  bool _obscureText = true;

  @override
  void dispose() {
    super.dispose();
    _login.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var state = this.ref.watch(loginControllerProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 120,
                width: double.infinity,
              ),
              if (state) CircularProgressIndicator(),
              Logo().logo(null, null),
              SizedBox(
                height: 20,
              ),
              _titreText(context),
              SizedBox(
                height: 50,
              ),
              _usernameField(),
              SizedBox(
                height: 10,
              ),
              _passwordField(_obscureText),
              SizedBox(
                height: 50,
              ),
              _validationBtn(context, this.ref),
            ],
          ),
        ),
      ),
    );
  }

  Text _titreText(BuildContext context) {
    return Text(
      "Authentification",
      style: Theme.of(context).textTheme.displayLarge,
    );
  }

  Widget _usernameField() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: TextFormField(
        controller: _login,
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

  Widget _passwordField(_obscureText) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: TextFormField(
        controller: _password,
        obscureText: _obscureText,
        cursorColor: Couleurs().secondary,
        decoration: InputDecoration(
          prefixIcon: IconButton(
              onPressed: () {
                setState(() {
                  this._obscureText = !_obscureText;
                });
              },
              icon: (_obscureText)
                  ? Icon(Icons.visibility)
                  : Icon(Icons.visibility_off)),
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

  Container _validationBtn(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: 120),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            elevation: 15, foregroundColor: Colors.black),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            //_validate(_login.text, _password.text);
            var ctrl = ref.read(loginControllerProvider.notifier);
            var authenticateUserRequest = AuthenticateUserRequest(
                username: _login.text, password: _password.text);
            var res = await ctrl.submitForm(authenticateUserRequest);
            if (res) {
              context.pushReplacement('/home');
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Identifiant ou mot de passe incorrect'),
                ),
              );
            }
          }
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
