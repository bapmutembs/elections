import 'package:flutter/material.dart';

class AgentEnregistrerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
          ),
          Text("Enregistrer Agent"),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Demarrer"),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
