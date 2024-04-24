import 'package:elections/pages/CandidatEnregistrer/CandidatEnregistrerPage.dart';
import 'package:elections/pages/CandidatList/CandidatListPage.dart';
import 'package:elections/pages/DepartementEnregistrer/DepartementEnregistrerPage.dart';
import 'package:elections/pages/DepartementList/DepartementListPage.dart';
import 'package:elections/pages/MissionEnregistrer/MissionEnregistrerPage.dart';
import 'package:elections/pages/MissionList/MissionListPage.dart';
import 'package:elections/utils/Colors.dart';
import 'package:elections/utils/Logo.dart';
import 'package:elections/widgets/mainMenu.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _header(context),
      drawer: mainMenu().mainmenu(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 180,
            width: double.infinity,
          ),
          Logo().logo(null, null),
          SizedBox(
            height: 20,
          ),
          Text(
            "Gestion Employe",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  AppBar _header(BuildContext context) {
    return AppBar(
      title: Text("Tableau de bord"),
      actions: [],
    );
  }
}
