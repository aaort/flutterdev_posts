import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show StreamProvider;

final connectivityProvider = StreamProvider<bool>((ref) {
  return ConnectivityProviderService().onChanges;
});

class ConnectivityProviderService {
  late final Connectivity _connectivity;

  ConnectivityProviderService() {
    _connectivity = Connectivity();
  }

  Stream<bool> get onChanges {
    return _connectivity.onConnectivityChanged.map((event) {
      return !(event == ConnectivityResult.none);
    });
  }
}
