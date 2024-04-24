import 'package:elections/business/Mission.dart';
import 'package:elections/pages/CandidatList/CandidatListController.dart';
import 'package:elections/pages/DepartementEnregistrer/DepartementEnregistrerPage.dart';
import 'package:elections/pages/DepartementList/DepartementListControlleur.dart';
import 'package:elections/pages/MissionList/MissionListController.dart';
import 'package:elections/pages/intro/introPage.dart';
import 'package:flutter/material.dart';

class DepartementListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _header(context),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Text(DepartementListController().get().length.toString() +
                    " ligne(s)"),
                Icon(Icons.filter_alt),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: _listDepartement(),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _header(BuildContext context) {
    return AppBar(
      title: Text("Departements"),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DepartementEnregistrerPage(),
              ),
            );
          },
          icon: Icon(Icons.add),
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DepartementListPage(),
              ),
            );
          },
          icon: Icon(Icons.sync),
        ),
      ],
    );
  }

  Widget _listDepartement() {
    return ListView.builder(
      itemCount: DepartementListController().get().length,
      prototypeItem: ListTile(
        title: Text(DepartementListController().get().first.nom),
      ),
      itemBuilder: (context, index) {
        return Card(
          clipBehavior: Clip.hardEdge,
          child: ListTile(
            onTap: () {},
            leading: Text("$index"),
            title: Text(DepartementListController().get()[index].nom),
            //subtitle: Text(CandidatListController().get()[index].poste),
            trailing: Icon(Icons.arrow_right),
          ),
        );
      },
    );
  }
}
