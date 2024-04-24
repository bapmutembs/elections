import 'package:elections/pages/paiement/paiementAgent.dart';

class ListPaiementCtrl {

List<PaiementAgent> listPresence = [];

List<PaiementAgent> get() {
  PaiementAgent agent1 = PaiementAgent(
      ref: "paiement salaire du 20/01",
      infoAgent: "10:20:10",
      montant: 5000,
      devise: "franc",
      due: "12/02/2024",
      modalite:"paiemnt",
      typePaiement:"",
      datePaiement:"12/02/2024");

  PaiementAgent agent2 = PaiementAgent(
      ref: "paiement salaired du 10/04 ",
      infoAgent: "10:20:10",
      montant: 5000,
      devise: "franc",
      due: "12/02/2024",
      modalite:"paiemnt",
      typePaiement:"",
      datePaiement:"12/02/2024");
  PaiementAgent agent3 = PaiementAgent(
      ref: "paiement salaire du 10/08",
      infoAgent: "10:20:10",
      montant: 5000,
      devise: "franc",
      due: "12/02/2024",
      modalite:"paiemnt",
      typePaiement:"",
      datePaiement:"12/02/2024");

  this.listPresence.addAll([agent1, agent2, agent3]);
  return this.listPresence;
}


}