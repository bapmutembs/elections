import 'package:elections/OnboardingPage.dart';
import 'package:elections/OnboardingPageModel.dart';
import 'package:elections/candidat/ui/pages/CandidatEnregistrer/CandidatEnregistrerPage.dart';
import 'package:elections/candidat/ui/pages/CandidatList/CandidatListPage.dart';
import 'package:elections/pages/Home/HomePage.dart';
import 'package:elections/pages/intro/introPage.dart';
import 'package:elections/user/ui/pages/Login/LoginPage.dart';
import 'package:elections/utils/Colors.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

final router = GoRouter(
  //refreshListenable: auth,
  debugLogDiagnostics: true,
  initialLocation: '/onboarding',
  redirect: (context, state) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? onboard = prefs.getBool('onboarding') ;
    String? token = prefs.getString('token') ;

    if((state.uri.toString() == '/onboarding') && (onboard != null)){
      return '/login';
    }

    if((state.uri.toString() == '/login') && (token != null)){
      return '/home';
    }

    if(((state.uri.toString() != '/login') && (state.uri.toString() != '/onboarding'))  && (token == null)){
      return '/login';
    }
  },
  routes: [
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => OnboardingPage(
        pages: [
          OnboardingPageModel(
            title: 'Rapide, Fluide et Securise',
            description:
                'Profitez du meilleur du monde dans vos propres mains.',
            image: 'assets/images/google.png',
          ),
          OnboardingPageModel(
            title: 'Real Madrid',
            description: 'Hala Madrid',
            image: 'assets/images/real_madrid_824734.png',
            bgColor: Couleurs().third,
          ),
          OnboardingPageModel(
            title: 'Hamburger',
            description: 'C\'est delicieux',
            image: 'assets/images/hamburger1.png',
            bgColor: Couleurs().primary,
          ),
          OnboardingPageModel(
            title: 'Gestion Employe',
            description: 'Bienvenue dans le futur',
            image: 'assets/images/logo/logo.png',
            bgColor: Colors.blueGrey,
          ),
        ],
      ),
    ),
    GoRoute(
      path: '/intro',
      builder: (context, state) => IntroPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/candidat',
      builder: (context, state) => CandididatListPage(),
      routes: [
        GoRoute(
          path: 'enregistrer',
          builder: (context, state) => CandidatEnregistrerPage(),
        ),
      ],
    ),
  ],
);
