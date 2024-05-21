import 'package:elections/mission/business/model/mission/Mission.dart';
import 'package:elections/candidat/ui/pages/CandidatList/CandidatListController.dart';
import 'package:elections/departement/ui/pages/DepartementEnregistrer/DepartementEnregistrerPage.dart';
import 'package:elections/departement/ui/pages/DepartementList/DepartementListControlleur.dart';
import 'package:elections/mission/ui/pages/MissionList/MissionListController.dart';
import 'package:elections/pages/intro/introPage.dart';
import 'package:elections/widgets/mainMenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DepartementListPage extends ConsumerStatefulWidget{
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => DepartementListPageState();

}
class DepartementListPageState extends ConsumerState<DepartementListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _header(context),
      drawer: mainMenu(context),
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
          icon: Icon(Icons.add_circle_outline_sharp),
        ),
      ],
    );
  }

  Widget _listDepartement() {
    return ListView.builder(
      itemCount: DepartementListController().get().length,
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
