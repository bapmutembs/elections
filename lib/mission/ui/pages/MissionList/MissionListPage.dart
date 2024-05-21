import 'package:elections/mission/business/model/mission/Mission.dart';
import 'package:elections/mission/ui/pages/MissionEnregistrer/MissionEnregistrerPage.dart';
import 'package:elections/mission/ui/pages/MissionList/MissionListController.dart';
import 'package:elections/pages/intro/introPage.dart';
import 'package:elections/widgets/mainMenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MissionListPage extends ConsumerStatefulWidget{
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => MissionListPageState();

}

class MissionListPageState extends ConsumerState<MissionListPage> {
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
          icon: Icon(Icons.add_circle_outline_sharp),
        ),
      ],
    );
  }

  Widget _listMission() {
    return ListView.builder(
      itemCount: MissionListController().get().length,
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
