import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './device_info_service.dart';


class AuthService {
  final FirebaseApp firebaseApp;
  final DeviceInfoService deviceInfoService;
  final FirebaseAuth firebaseAuth;

  final BehaviorSubject<FirebaseUser> user;

  AuthService({
    @required this.firebaseApp,
    @required this.deviceInfoService
  }) 
      : this.firebaseAuth = FirebaseAuth.fromApp(firebaseApp),
        user = BehaviorSubject<FirebaseUser>.seeded(null) {
    firebaseAuth.currentUser().then((firebaseUser) {
      if (firebaseUser == null) {
        print('[AuthService] anonymous sign in');
        anonymousSignIn();
      } else {
        print('[AuthService] already authenticated');
      }
    });
    firebaseAuth.onAuthStateChanged.listen((firebaseUser) {
      if (firebaseUser != null) {
        print('[AuthService] uid = ${firebaseUser.uid}');
      }
      user.sink.add(firebaseUser);
    });
  }

  Future<FirebaseUser> anonymousSignIn() async {
    final result = await firebaseAuth.signInAnonymously();
    return result.user;
  }

  dispose() {
    user.close();
  }
}