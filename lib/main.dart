import 'package:flutter/material.dart';

import 'AppConstant.dart';
import 'YoFlutterSerialize.dart';

void main() => runApp(FlutterAppApi());

class FlutterAppApi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstant.appTitle,
      theme: ThemeData(primaryColor: Colors.green.shade800),
      home: YoFlutterSerialize(),
    );
  }
}
