import 'package:flutter/material.dart';

const _connectionLostMessage = 'Sorry, internet connection is lost';
const _connectionExistMessage = 'You\'re connected to the internet';

void showConnectivityInfo({
  required BuildContext context,
  required bool isConnected,
}) {
  final message =
      isConnected ? _connectionExistMessage : _connectionLostMessage;

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
