import 'package:elections/candidat/ui/pages/CandidatEnregistrer/CandidatEnregistrerPage.dart';
import 'package:elections/candidat/ui/pages/CandidatList/CandidatListPage.dart';
import 'package:elections/departement/ui/pages/DepartementEnregistrer/DepartementEnregistrerPage.dart';
import 'package:elections/departement/ui/pages/DepartementList/DepartementListPage.dart';
import 'package:elections/user/ui/pages/Login/LoginPage.dart';
import 'package:elections/mission/ui/pages/MissionEnregistrer/MissionEnregistrerPage.dart';
import 'package:elections/mission/ui/pages/MissionList/MissionListPage.dart';
import 'package:elections/utils/Colors.dart';
import 'package:elections/utils/Logo.dart';
import 'package:elections/widgets/mainMenu.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            width: double.infinity,
          ),
          Logo().logo(null, null),
          SizedBox(
            height: 20,
          ),
          Text(
            "Gestion Employe",
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Spacer(),
          Container(
            width: double.infinity,
            height: 60,
            margin: EdgeInsets.symmetric(horizontal: 120),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  elevation: 15, foregroundColor: Colors.black),
              onPressed: () {
                context.pushReplacement('/login');
              },
              label: Text(
                "Demarrer",
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
          ),
          SizedBox(
            height: 200,
          ),
        ],
      ),
    );
  }
}
