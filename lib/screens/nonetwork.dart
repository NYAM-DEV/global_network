import 'package:flutter/material.dart';
import 'package:global_network/enums/displaytype.dart';
import 'package:provider/provider.dart';
import '../utils/export.dart';
import '../enums/connectivity_status.dart';

class NetworkSensitive extends StatelessWidget {
  final Widget child;
  final Displaytype? type;
  final Widget? errorScreen;

  NetworkSensitive({
    required this.child,
    this.type,
    this.errorScreen,
  });

  @override
  Widget build(BuildContext context) {
    var connectionStatus = Provider.of<ConnectivityStatus>(context);

    if (connectionStatus == ConnectivityStatus.WiFi) {
      return child;
    }

    if (connectionStatus == ConnectivityStatus.Cellular) {
      return child;
    }

    if (type == Displaytype.alertBox) {
      return NoNetworkAlert(
          key: Key('NoNetworkAlert'),
      child: child);
    }

    if (type == Displaytype.bottomModalSheet) {
      return NoNetworkModalBottomSheet(
          key: Key('NoNetworkModalBottomSheet'),
      child: child);
    }

    if (type == Displaytype.bottomSheet) {
      return NoNetworkBottomSheet(
          key: Key('NoNetworkBottomSheet'),
      child: child);
    }

    if (type == Displaytype.fullscreen) {
      return Nonetwork(
        errorScreen: errorScreen!,
        key: Key('Nonetwork'),);
    }

    return Nonetwork(key: Key('Nonetwork'), errorScreen: SizedBox(),);
  }
}
