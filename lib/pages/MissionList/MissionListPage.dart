import 'package:elections/business/Mission.dart';
import 'package:elections/pages/MissionEnregistrer/MissionEnregistrerPage.dart';
import 'package:elections/pages/MissionList/MissionListController.dart';
import 'package:elections/pages/intro/introPage.dart';
import 'package:flutter/material.dart';

class MissionListPage extends StatelessWidget {

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
                Text(MissionListController().get().length.toString() +
                    " ligne(s)"),
                Icon(Icons.filter_alt),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: _listMission(),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _header(BuildContext context) {
    return AppBar(
      title: Text("Missions"),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MissionEnregistrerPage(),
              ),
            );
          },
          icon: Icon(Icons.add),
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MissionListPage(),
              ),
            );
          },
          icon: Icon(Icons.sync),
        ),
      ],
    );
  }

  Widget _listMission() {
    return ListView.builder(
      itemCount: MissionListController().get().length,
      prototypeItem: ListTile(
        title: Text(MissionListController().get().first.detail.objectif),
      ),
      itemBuilder: (context, index) {
        return Card(
          clipBehavior: Clip.hardEdge,
          child: ListTile(
            onTap: () {},
            leading: Text("$index"),
            title: Text(MissionListController().get()[index].detail.objectif),
            //subtitle: Text(CandidatListController().get()[index].poste),
            trailing: Icon(Icons.arrow_right),
          ),
        );
      },
    );
  }

}
