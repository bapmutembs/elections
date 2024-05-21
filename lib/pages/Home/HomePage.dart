import 'package:elections/candidat/ui/pages/CandidatEnregistrer/CandidatEnregistrerPage.dart';
import 'package:elections/candidat/ui/pages/CandidatList/CandidatListPage.dart';
import 'package:elections/departement/ui/pages/DepartementEnregistrer/DepartementEnregistrerPage.dart';
import 'package:elections/departement/ui/pages/DepartementList/DepartementListPage.dart';
import 'package:elections/mission/ui/pages/MissionEnregistrer/MissionEnregistrerPage.dart';
import 'package:elections/mission/ui/pages/MissionList/MissionListPage.dart';
import 'package:elections/user/business/model/user/CreateUserRequest.dart';
import 'package:elections/user/business/model/user/User.dart';
import 'package:elections/user/ui/pages/Login/LoginController.dart';
import 'package:elections/utils/Colors.dart';
import 'package:elections/utils/Logo.dart';
import 'package:elections/widgets/mainMenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends ConsumerStatefulWidget {
  @override
  ConsumerState createState() => MyState();
}

class MyState extends ConsumerState<HomePage> {
  User user = User();

  @override
  void initState() {
    super.initState();
    refresh();
  }

  Future<void> refresh() async {
    var ctlr = this.ref.read(loginControllerProvider.notifier);
    var resp = await ctlr.getTheUser();

    setState(() {
      user = resp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _header(context),
      drawer: mainMenu(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            width: double.infinity,
          ),
          Logo().logo(null, null),
          SizedBox(
            height: 10,
          ),
          Text(
            "Gestion Employe",
            style: Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(
            height: 80,
          ),
          Text(
            "Bienvenue ${user.name ?? ""}",
            style: Theme.of(context).textTheme.displayMedium,
          ),
          SizedBox(
            height: 100,
          ),
          (user.name.isEmpty)
          ? _addUserBtn(context, this.ref)
          : SizedBox(),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  AppBar _header(BuildContext context) {
    return AppBar(
      title: Text(
        "Tableau de bord",
        style: Theme.of(context).textTheme.displayLarge,
      ),
      actions: [],
    );
  }
}

Container _addUserBtn(BuildContext context, WidgetRef ref) {
  return Container(
    width: double.infinity,
    height: 60,
    margin: EdgeInsets.symmetric(horizontal: 120),
    child: ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
          elevation: 15, foregroundColor: Colors.black),
      onPressed: () async {
        var ctrl = ref.read(loginControllerProvider.notifier);
        var createUserRequest = CreateUserRequest(
            phone: "+243819283477",
            name: "Baptiste Mutemba",
            email: "bapmutembs@gmail.com",
            password: "1346",
            confirmPassword: "1346");
        var resp = await ctrl.createUser(createUserRequest);
        if (resp) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Utilisateur cree avec succes'),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Utilisateur non cree'),
            ),
          );
        }
      },
      label: Text(
        "Creer user",
        style: Theme.of(context).textTheme.displaySmall,
      ),
      icon: Icon(
        Icons.send,
        size: 18,
      ),
    ),
  );
}
