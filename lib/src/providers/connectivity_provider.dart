import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show FutureProvider, StreamProvider;

final connectivityProvider = StreamProvider<bool>((ref) {
  return Connectivity().onConnectivityChanged.map((event) {
    return !(event == ConnectivityResult.none);
  });
});

final isConnectedProvider = FutureProvider.autoDispose<bool>((ref) async {
  return (await Connectivity().checkConnectivity()) != ConnectivityResult.none;
});
