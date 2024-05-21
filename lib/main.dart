import 'dart:io' show Platform;
import 'package:elections/candidat/business/interactors/CandidatInteractor.dart';
import 'package:elections/candidat/ui/framework/CandidatNetworkServiceImplV1.dart';
import 'package:elections/candidat/ui/framework/CandidatNetworkServiceImplV2.dart';
import 'package:elections/user/business/interactors/UserInteractor.dart';
import 'package:elections/user/ui/framework/UserLocalServiceImplV1.dart';
import 'package:elections/user/ui/framework/UserNetworkServiceImplV1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:window_size/window_size.dart';
import 'package:elections/routes/app.dart';
import 'package:elections/common/theme.dart';

void main() {
  var userNetwork = UserNetworkServiceImplV1();
  var userLocal = UserLocalServiceImplV1();
  var userInteractor = UserInteractor.build(userNetwork, userLocal);

  var candidatNetwork = CandidatNetworkServiceImplV1();
  var candidatInteractor = CandidatInteractor.build(candidatNetwork);

  setupWindow();

  runApp(
    ProviderScope(
      overrides: [
        candidatInteractorProvider.overrideWithValue(candidatInteractor),
        userInteractorProvider.overrideWithValue(userInteractor),
      ],
      child: MyApp(),
    ),
  );
}

const double windowWidth = 400;
const double windowHeight = 800;

void setupWindow() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    WidgetsFlutterBinding.ensureInitialized();
    setWindowTitle('Gestion Employe');
    setWindowMinSize(const Size(windowWidth, windowHeight));
    setWindowMaxSize(const Size(windowWidth, windowHeight));
    getCurrentScreen().then((screen) {
      setWindowFrame(Rect.fromCenter(
        center: screen!.frame.center,
        width: windowWidth,
        height: windowHeight,
      ));
    });
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Gestion Employe',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      routerConfig: router,
    );
  }
}
