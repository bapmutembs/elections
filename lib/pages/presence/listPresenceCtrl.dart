import 'package:elections/pages/presence/pagePresence.dart';
import 'package:elections/pages/presence/presence.dart';

class ListPresenceCtrl {

  List<Presence> listPresence = [];

  List<Presence> get() {
    Presence agent1 = Presence(id: 1,
        nom: "Chritelle",
        heureArrivee: "10:20:10",
        heureDepart: "16:30:00",
        dateArrivee: "12/02/2024",
        dateDepart: "12/02/2024");
    Presence agent2 = Presence(id: 1,
        nom: "Elfi",
        heureArrivee: "10:20:10",
        heureDepart: "16:30:00",
        dateArrivee: "12/02/2024",
        dateDepart: "12/02/2024");
    Presence agent3 = Presence(id: 1,
        nom: "Aicha",
        heureArrivee: "10:20:10",
        heureDepart: "16:30:00",
        dateArrivee: "12/02/2024",
        dateDepart: "12/02/2024");

    this.listPresence.addAll([agent1, agent2, agent3]);
    return this.listPresence;
  }


}