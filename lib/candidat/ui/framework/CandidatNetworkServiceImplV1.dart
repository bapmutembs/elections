import 'package:elections/candidat/business/model/candidat/Candidat.dart';
import 'package:elections/candidat/business/model/candidat/CreateCandidatRequest.dart';
import 'package:elections/candidat/business/service/CandidatNetworkService.dart';
import 'package:elections/utils/db.dart';

class CandidatNetworkServiceImplV1 implements CandidatNetworkService {
  var bd = db();
  String fichier = 'candidats.json';

  @override
  Future<bool> createCandidat(CreateCandidatRequest data) async {
    var resp = await bd.write(data.toJson(), this.fichier);
    print("Creation candidat");
    return Future.value(resp);
  }

  @override
  Future<bool> disableAllCandidat() async {
    var resp = await bd.deleteAll(this.fichier);

    return Future.value(resp);
  }

  @override
  Future<List<Candidat>> getAllCandidat() async {
    var resp = await bd.read(this.fichier);

    List<Candidat> candidats = [];

    if (resp.length > 0) {
      for (var line in resp) {
        print(line["email"]);
        Candidat candidat = Candidat(
          nomComplet: line["nomComplet"],
          sexe: line["sexe"],
          email: line["email"],
          telephone: line["telephone"],
          poste: line["poste"],
          dateNaissance: line["dateNaissance"],
          etatCivil: line["etatCivil"],
          niveauEtude: line["niveauEtude"],
        );
        candidats.add(candidat);
      }
    }

    return Future.value(candidats);
  }

  @override
  Future getCandidat(String token) {
    // TODO: implement getCandidat
    throw UnimplementedError();
  }

  @override
  Future<bool> disableCandidat(Candidat candidat) async{
    var resp = await bd.delete(candidat.toJson() ,this.fichier);
    return Future.value(resp);
  }
}
