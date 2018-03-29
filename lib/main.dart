import 'package:flutter/material.dart';

import 'strings.dart';
import 'YoFlutter.dart';

void main() => runApp(new FlutterAppApi());


class FlutterAppApi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: strings.appTitle,
      theme: new ThemeData(primaryColor: Colors.green.shade800),
      home: new YoFlutter(),
    );
  }
}