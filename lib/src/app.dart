import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'bloc/provider.dart';

import 'screens/home_screen.dart';


class App extends StatelessWidget {
  static FirebaseApp firebaseApp = FirebaseApp(name: FirebaseApp.defaultAppName);
  Widget build(BuildContext context) {
    return Provider(
      firebaseApp: firebaseApp,
      child: MaterialApp(
        title: 'Chess',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: _routes,
        debugShowCheckedModeBanner: false,
      )
    );
  }

  Route _routes(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      // maintainState: true,
      builder: (BuildContext context) {
        return SafeArea(
          child: _handleRoute(settings)
        );
      }
    );
  }

  Widget _handleRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/': {
        return HomeScreen();
      }
      case '/home': {
        return HomeScreen();
      }
      default: {
        return HomeScreen();
      }
    }
  }
}
