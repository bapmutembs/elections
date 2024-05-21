import 'package:elections/candidat/business/model/candidat/Candidat.dart';
import 'package:elections/candidat/ui/pages/CandidatDetail/CandidatDetailPage.dart';
import 'package:elections/candidat/ui/pages/CandidatList/CandidatListController.dart';
import 'package:elections/candidat/ui/pages/CandidatList/CandidatPlaceholders.dart';
import 'package:elections/utils/Colors.dart';
import 'package:elections/widgets/mainMenu.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swipeable_tile/swipeable_tile.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shimmer/shimmer.dart';

class CandididatListPage extends StatefulWidget {
  const CandididatListPage({Key? key}) : super(key: key);

  @override
  _CandididatListPageState createState() => _CandididatListPageState();
}

class _CandididatListPageState extends State<CandididatListPage> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const ClampingScrollPhysics(),
      children: <Widget>[
        CardScreen(),
      ],
    );
  }
}

class CardScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CardScreenState();
}

class _CardScreenState extends ConsumerState<CardScreen> {
  List<Candidat> candidats = <Candidat>[];
  var state;

  void initState() {
    super.initState();
    refresh();
  }

  Future<void> refresh() async {
    var controller = this.ref.read(candidatListControllerProvider.notifier);
    state = false;
    List<Candidat> resp = await controller.getList();
    state = true;

    setState(() {
      candidats = resp;
    });
  }

  Future<bool> _deleteAll() async {
    var controller = this.ref.read(candidatListControllerProvider.notifier);
    var resp = await controller.disableAll();

    setState(() {
      refresh();
    });

    return resp;
  }

  Future<bool> _delete(Candidat candidat) async {
    var controller = this.ref.read(candidatListControllerProvider.notifier);
    var resp = await controller.disable(candidat);

    setState(() {
      refresh();
    });

    return resp;
  }

  @override
  Widget build(BuildContext context) {
    var nameStyle = Theme.of(context).textTheme;

    return Scaffold(
      drawer: mainMenu(context),
      appBar: AppBar(
        title: Text(
          'Candidats',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        actions: [
          IconButton(
            onPressed: () async {
              if (await _deleteAll()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Suppression reussi'),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Suppression echoue'),
                  ),
                );
              }
            },
            icon: Icon(Icons.remove_circle_outline),
          ),
          IconButton(
            onPressed: () => context.go('/candidat/enregistrer'),
            icon: Icon(Icons.add_circle_outline_sharp),
          ),
        ],
      ),
      body: FutureBuilder(
          future: refresh(),
          builder: (context, snapshot) {
            if (((state == true) ||
                    (snapshot.connectionState == ConnectionState.waiting)) &&
                (candidats.isEmpty)) {
              return _shimmer(_refreshBtn(context, ref, refresh));
            } else if ((state == false) && (candidats.isNotEmpty)) {
              return _dataList(candidats, nameStyle, _delete);
            } else {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'No Data',
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      _refreshBtn(context, ref, refresh)
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }
}

Column _dataList(candidats, nameStyle, delete) {
  return Column(
    children: [
      Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView.builder(
            itemCount: candidats.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CandidatDetailPage(
                      candidat: candidats[index],
                    ),
                  ),
                );
              },
              child: SwipeableTile.card(
                key: UniqueKey(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(48),
                      child: Container(
                        margin: EdgeInsets.all(2),
                        child: Image.asset("assets/images/avatar.jpeg"),
                      ),
                    ),
                    //leading: const Icon(Icons.people),
                    trailing: IconButton(
                      icon: const Icon(Icons.remove_red_eye),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Page pas encore disponible'),
                          ),
                        );
                      },
                    ),
                    title: Text(
                      (candidats[index].sexe == 'Feminin')
                          ? 'Mme. ' + candidats[index].nomComplet
                          : 'Mr. ' + candidats[index].nomComplet,
                      style: nameStyle.titleMedium,
                    ),
                    subtitle: Text(
                      "${candidats[index].email} - ${candidats[index].telephone}",
                      style: nameStyle.titleSmall,
                    ),
                  ),
                ),
                backgroundBuilder: (_, SwipeDirection direction,
                    AnimationController progress) {
                  return AnimatedBuilder(
                    animation: progress,
                    builder: (_, __) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        color: progress.value > 0.4
                            ? const Color(0xFFed7474)
                            : const Color(0xFFeded98),
                      );
                    },
                  );
                },
                horizontalPadding: 2,
                verticalPadding: 8,
                shadow: BoxShadow(
                  color: Colors.black.withOpacity(0.35),
                  blurRadius: 4,
                  offset: const Offset(2, 2),
                ),
                color: Couleurs().primary.shade50,
                onSwiped: (_) {
                  delete(candidats[index]);
                },
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

ListView _shimmer(refreshBtn) {
  return ListView(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          enabled: true,
          child: const SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                ContentPlaceholder(
                  lineType: ContentLineType.twoLines,
                ),
                SizedBox(height: 16.0),
                ContentPlaceholder(
                  lineType: ContentLineType.twoLines,
                ),
                SizedBox(height: 16.0),
                ContentPlaceholder(
                  lineType: ContentLineType.twoLines,
                ),
              ],
            ),
          ),
        ),
      ),
      Center(
        child: Column(
          children: [
            LoadingAnimationWidget.dotsTriangle(
              color: Couleurs().primary,
              size: 40,
            ),
            SizedBox(
              height: 50,
            ),
            refreshBtn,
          ],
        ),
      )
    ],
  );
}

Container _refreshBtn(BuildContext context, WidgetRef ref, refresh) {
  return Container(
    width: double.infinity,
    height: 60,
    margin: EdgeInsets.symmetric(horizontal: 30),
    child: ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
          elevation: 15, foregroundColor: Colors.black),
      onPressed: () async {
        refresh();
      },
      label: Text(
        "Rafraichir",
        style: Theme.of(context).textTheme.displayMedium,
      ),
      icon: Icon(
        Icons.send,
        size: 18,
      ),
    ),
  );
}
