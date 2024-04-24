import 'package:elections/business/Mission.dart';
import 'package:elections/pages/CandidatEnregistrer/CandidatEnregistrerPage.dart';
import 'package:elections/pages/CandidatList/CandidatListController.dart';
import 'package:elections/pages/MissionList/MissionListController.dart';
import 'package:elections/pages/intro/introPage.dart';
import 'package:elections/utils/Colors.dart';
import 'package:elections/widgets/mainMenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CandididatListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _header(context),
      drawer: mainMenu().mainmenu(context),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Text(CandidatListController().get().length.toString() +
                    " ligne(s)"),
                Icon(Icons.filter_alt),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: _listCandidat(),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _header(BuildContext context) {
    return AppBar(
      title: Text("Candidats"),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CandidatEnregistrerPage(),
              ),
            );
          },
          icon: Icon(Icons.add),
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CandididatListPage(),
              ),
            );
          },
          icon: Icon(Icons.sync),
        ),
      ],
    );
  }

  Widget _listCandidat() {
    return ListView.builder(
      itemCount: CandidatListController().get().length,
      prototypeItem: ListTile(
        title: Text(CandidatListController().get().first.nom_complet),
      ),
      itemBuilder: (context, index) {
        return Card(
          clipBehavior: Clip.hardEdge,
          child: ListTile(
            onTap: () {},
            leading: Text("$index"),
            title: Text(CandidatListController().get()[index].nom_complet),
            //subtitle: Text(CandidatListController().get()[index].poste),
            trailing: Icon(Icons.arrow_right),
          ),
        );
      },
    );
  }
}
