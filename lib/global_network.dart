library global_network;

import 'package:flutter/material.dart';
import 'utils/export.dart';
export 'package:global_network/utils/export.dart';

class GlobalNetwork extends StatelessWidget {
  final Widget child;
  final Displaytype? type;
  final Widget? errorScreen;

  const GlobalNetwork(
      {required Key key, required this.child, this.type, this.errorScreen})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return NetworkSensitive(child: child, type: type, errorScreen: errorScreen);
  }
}
