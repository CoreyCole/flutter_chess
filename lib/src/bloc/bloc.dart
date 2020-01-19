import 'package:firebase_core/firebase_core.dart';

import 'services/auth_service.dart';
import 'services/chess_service.dart';
import 'services/connectivity_service.dart';
import 'services/device_info_service.dart';
import 'services/firebase_service.dart';
import 'services/storage_service.dart';

import 'models.dart';
export 'models.dart';


class Bloc {
  AuthService auth;
  ChessService chess;
  ConnectivityService connectivity;
  DeviceInfoService deviceInfo;
  FirebaseService firebaseService;
  StorageService storage;

  Bloc({
    FirebaseApp firebaseApp,
  }) {
    storage = StorageService();
    storage.init();
    connectivity = ConnectivityService();
    deviceInfo = DeviceInfoService();
    auth = AuthService(
      firebaseApp: firebaseApp,
      deviceInfoService: deviceInfo,
    );
    firebaseService = FirebaseService(
      firebaseApp: firebaseApp,
      connectivityService: connectivity,
      user: auth.user,
    );
    chess = ChessService();
  }

  dispose() {
  }
}
