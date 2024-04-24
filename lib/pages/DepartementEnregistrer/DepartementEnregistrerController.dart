import 'package:elections/business/Candidat.dart';
import 'package:http/http.dart' as http;

class DepartementEnregistrerController {
  var url = Uri.parse('https://bot.akili-tech.com/api');

  Future<String> send(String sender) async {
    var body = {'app': 'WhatsAuto', 'sender': sender, 'message': '20/20/2020'};
    var response = await http.post(url,
        headers: {'bot' : 'fiston'},
        body: body);

    if (response.statusCode == 200) {
      return "Le departement a ete ajoute avec succes" ;
    } else {
      return 'Requete echouee with ${response.statusCode} ';
    }
  }
}
