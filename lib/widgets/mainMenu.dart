import 'package:elections/candidat/ui/pages/CandidatList/CandidatListPage.dart';
import 'package:elections/departement/ui/pages/DepartementList/DepartementListPage.dart';
import 'package:elections/pages/Home/HomePage.dart';
import 'package:elections/user/ui/pages/Login/LoginController.dart';
import 'package:elections/user/ui/pages/Login/LoginPage.dart';
import 'package:elections/mission/ui/pages/MissionList/MissionListPage.dart';
import 'package:elections/pages/intro/introPage.dart';
import 'package:elections/pages/offre/offreList.dart';
import 'package:elections/pages/paiement/listpaiement.dart';
import 'package:elections/pages/presence/listPresence.dart';
import 'package:elections/pages/prime/pagePrime.dart';
import 'package:elections/utils/Colors.dart';
import 'package:elections/utils/Logo.dart';
import 'package:elections/utils/db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class mainMenu extends ConsumerStatefulWidget {
  mainMenu(BuildContext context);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => mainMenuState();
}

class mainMenuState extends ConsumerState<mainMenu> {
  String? _token;

  void initState() {
    super.initState();
    refresh();
  }

  Future<void> refresh() async {
    var ctlr = this.ref.read(loginControllerProvider.notifier);
    var resp = await ctlr.getTheToken();

    setState(() {
      _token = resp;
    });
  }

  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Column(
              children: [
                Logo().logo(40, 40),
                Text(
                  'Gestion Employe',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => HomePage(),
                ),
              );
            },
            title: Text("Tableau de bord"),
            leading: Icon(Icons.home),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => CandididatListPage(),
                ),
              );
            },
            title: Text("Candidats"),
            leading: Icon(Icons.people_alt_outlined),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => DepartementListPage(),
                ),
              );
            },
            title: Text("Departement"),
            leading: Icon(Icons.business_outlined),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => MissionListPage(),
                ),
              );
            },
            title: Text("Missions"),
            leading: Icon(Icons.travel_explore),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => OffrePage(),
                ),
              );
            },
            title: Text("Offre Emploi"),
            leading: Icon(Icons.local_offer),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => ListPaiement(),
                ),
              );
            },
            title: Text("Paiement"),
            leading: Icon(Icons.monetization_on),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => ListPresence(),
                ),
              );
            },
            title: Text("Presence"),
            leading: Icon(Icons.list_alt),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => PagePrime(),
                ),
              );
            },
            title: Text("Prime"),
            leading: Icon(Icons.money_outlined),
          ),
          Divider(),
          (_token == null)
              ? ListTile()
              : ListTile(
                  onTap: () async {
                    var ctlrr = this.ref.watch(loginControllerProvider.notifier);
                    ctlrr.disconnect();
                    context.pushReplacement('/login');
                  },
                  title: Text("Deconnexion"),
                  leading: Icon(Icons.logout),
                ),
        ],
      ),
    );
  }
}
