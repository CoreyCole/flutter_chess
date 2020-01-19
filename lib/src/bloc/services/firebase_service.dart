import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import './connectivity_service.dart';
import '../models.dart';

class FirebaseService {
  final Firestore firestore = Firestore();
  final FirebaseApp firebaseApp;
  final ConnectivityService connectivityService;
  final BehaviorSubject<FirebaseUser> user;

  FirebaseService({
    @required this.firebaseApp,
    @required this.connectivityService,
    @required this.user,
  }) {
    firestore.settings(
      sslEnabled: true,
      persistenceEnabled: true,
    );
  }
}