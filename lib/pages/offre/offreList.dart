import 'package:flutter/material.dart';
import 'package:elec/pages/offre/offreList.dart';

class OffrePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _enteteOffre(),
        drawer: _menuPrincipale(),

        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("30 lignes"),
                    Icon(Icons.filter_alt),
                  ],
                ),

                Expanded(child: _OffreLsit())

              ],
            )));
  }

  AppBar _enteteOffre() {
    return AppBar(
      elevation: 4,
      title: Text("La liste des Postes "),
      foregroundColor: Colors.black,
      backgroundColor: Colors.yellow.shade800,
      actions: [
         IconButton(onPressed: () {}, icon: Icon(Icons.add)),
        IconButton(onPressed: () {}, icon: Icon(Icons.sync)),
      ],
    );
  }

  Drawer _menuPrincipale() {
    return Drawer(
        child: ListView(
            shrinkWrap: true,
            children: [

              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.yellow.shade800,
                ), child: Text("LISTES DES POSTES"),
              ),
              ListTile(
                title: Text("Tableau de Bord"),
                leading: Icon(Icons.dashboard),



              ),
              Divider(),
              ListTile(
                title: Text("deconnexion"),
                leading: Icon(Icons.logout),
              )
            ]));
  } ////DRAWER
var  container = Container();
  Widget _OffreLsit() {
    return ListView.builder(
        itemCount: 30,
        itemBuilder: (ctx, index) {
          return ListTile(


            leading: Text("$index"),
            title: Text("Employée"),
            trailing: Icon(Icons.badge),
          );
        }
    );
  }
}
