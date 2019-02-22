import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'AppConstant.dart';
import 'MemberDataSerialize.dart';

class YoFlutterSerialize extends StatefulWidget {
  @override
  createState() => YoFlutterState();
}

class YoFlutterState extends State<YoFlutterSerialize> {
  var _members = <MemberDataSerialize>[];

  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _smallerFont = const TextStyle(fontSize: 12.0);
  bool _loading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppConstant.appTitle),
        ),
        body: ModalProgressHUD(
          inAsyncCall: _loading,
          dismissible: true,
          child: ListView.builder(
              itemCount: _members.length * 2,
              itemBuilder: (BuildContext context, int position) {
                if (position.isOdd) return Divider();

                final index = position ~/ 2;

                return _buildRow(index);
              }),
        ),
        drawer: Drawer(
          child: Material(
            child: ListView(
              children: <Widget>[
                Container(
                  // Fake a drawer header
                  color: Theme.of(context).primaryColor,
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top + 16.0,
                      bottom: 16.0),
                  child: ListTile(
                    leading: Icon(Icons.watch_later,
                        color: Theme.of(context).primaryTextTheme.title.color),
                    title: Text('Settings',
                        style: Theme.of(context).primaryTextTheme.title),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.alarm),
                  title: Text('Clock Type', textScaleFactor: 1.5),
                  dense: true,
                ),
                ListTile(
                  leading: Icon(Icons.adb),
                  title: Text('Alarm', textScaleFactor: 1.5),
                  dense: true,
                )
              ],
            ),
          ),
        ));
  }

  _loadData() async {
    String dataURL = "https://limitless-lake-93364.herokuapp.com/hello";
    http.Response response = await http.get(dataURL);

    setState(() {
      final Map membersJSON = json.decode(response.body);
//      var myObject = MemberDataSerialize.fromJson(membersJSON);

      _loading = false;
      print(membersJSON["employee"]);

      for (var memberJSON in membersJSON["employee"]) {
        final member = MemberDataSerialize.fromJson(memberJSON);
        print(member);
        _members.add(member);
      }
    });
  }

  @override
  void initState() {
    super.initState();

    _loadData();
  }

  Widget _buildRow(int i) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListTile(
          title: Text("${_members[i].name}", style: _biggerFont),
//          subtitle: Text("${_members[i].age}", style: _smallerFont),
        ));
  }
}
