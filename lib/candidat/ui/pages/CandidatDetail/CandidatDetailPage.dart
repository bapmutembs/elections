import 'package:elections/candidat/business/model/candidat/Candidat.dart';
import 'package:elections/utils/Colors.dart';
import 'package:flutter/material.dart';

class CandidatDetailPage extends StatelessWidget {
  CandidatDetailPage({required this.candidat});
  Candidat candidat;

  @override
  Widget build(BuildContext context) {
    var nameStyle = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Couleurs().primary.shade200,
      ),
      body: Column(
        children: [
          Expanded(flex: 2, child: _TopPortion()),
          Text(
            candidat.nomComplet,
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  SizedBox(height: 10),
                  _detail(candidat, nameStyle),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _detail(Candidat candidat, nameStyle) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: ListTile(
          leading: const Icon(Icons.person_2_outlined),
          title: Text(
            "Nom",
            style: nameStyle.titleMedium,
          ),
          subtitle: Text(
            candidat.nomComplet,
          ),
        ),
      ),
      Divider(
        indent: 50,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: ListTile(
          leading: const Icon(Icons.phone),
          title: Text(
            "Telephone",
            style: nameStyle.titleMedium,
          ),
          subtitle: Text(
            candidat.telephone,
          ),
        ),
      ),
      Divider(
        indent: 50,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: ListTile(
          leading: const Icon(Icons.mail_outline_outlined),
          title: Text(
            "Email",
            style: nameStyle.titleMedium,
          ),
          subtitle: Text(
            candidat.email,
          ),
        ),
      ),
      Divider(
        indent: 50,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: ListTile(
          leading: const Icon(Icons.person_2_outlined),
          title: Text(
            "Etat Civil",
            style: nameStyle.titleMedium,
          ),
          subtitle: Text(
            candidat.etatCivil,
          ),
        ),
      ),
      Divider(
        indent: 50,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: ListTile(
          leading: const Icon(Icons.person_2_outlined),
          title: Text(
            "Sexe",
            style: nameStyle.titleMedium,
          ),
          subtitle: Text(
            candidat.sexe,
          ),
        ),
      ),
      Divider(
        indent: 50,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: ListTile(
          leading: const Icon(Icons.list_alt_outlined),
          title: Text(
            "Poste",
            style: nameStyle.titleMedium,
          ),
          subtitle: Text(
            candidat.poste,
          ),
        ),
      ),
      Divider(
        indent: 50,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: ListTile(
          leading: const Icon(Icons.view_agenda_outlined),
          title: Text(
            "Date de naissance",
            style: nameStyle.titleMedium,
          ),
          subtitle: Text(
            candidat.dateNaissance,
          ),
        ),
      ),
      Divider(
        indent: 50,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: ListTile(
          leading: const Icon(Icons.school_outlined),
          title: Text(
            "Niveau d'etude",
            style: nameStyle.titleMedium,
          ),
          subtitle: Text(
            candidat.niveauEtude,
          ),
        ),
      ),
      Divider(
        indent: 50,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: ListTile(
          leading: const Icon(Icons.tag),
          title: Text(
            "Status",
            style: nameStyle.titleMedium,
          ),
          subtitle: Text(
            candidat.status,
          ),
        ),
      ),
    ],
  );
}

// class _ProfileInfoRow extends StatelessWidget {
//   const _ProfileInfoRow({Key? key}) : super(key: key);

//   final List<ProfileInfoItem> _items = const [
//     ProfileInfoItem("Posts", 900),
//     ProfileInfoItem("Followers", 120),
//     ProfileInfoItem("Following", 200),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 80,
//       constraints: const BoxConstraints(maxWidth: 400),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: _items
//             .map((item) => Expanded(
//                     child: Row(
//                   children: [
//                     if (_items.indexOf(item) != 0) const VerticalDivider(),
//                     Expanded(child: _singleItem(context, item)),
//                   ],
//                 )))
//             .toList(),
//       ),
//     );
//   }

//   Widget _singleItem(BuildContext context, ProfileInfoItem item) => Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               item.value.toString(),
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20,
//               ),
//             ),
//           ),
//           Text(
//             item.title,
//             style: Theme.of(context).textTheme.caption,
//           )
//         ],
//       );
// }

// class ProfileInfoItem {
//   final String title;
//   final int value;
//   const ProfileInfoItem(this.title, this.value);
// }

class _TopPortion extends StatelessWidget {
  const _TopPortion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 50),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Couleurs().primary.shade200,
                Couleurs().primary.shade200,
              ],
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: 150,
            height: 150,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80')),
                  ),
                ),
                // Positioned(
                //   bottom: 0,
                //   right: 0,
                //   child:
                //   CircleAvatar(
                //     radius: 20,
                //     backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                //     child: Container(
                //       margin: const EdgeInsets.all(8.0),
                //       decoration: const BoxDecoration(
                //           color: Colors.green, shape: BoxShape.circle),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
