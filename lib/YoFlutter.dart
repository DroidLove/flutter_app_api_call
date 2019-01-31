import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'AppConstant.dart';
import 'MemberData.dart';

class YoFlutter extends StatefulWidget {
  @override
  createState() => YoFlutterState();
}

class YoFlutterState extends State<YoFlutter> {
  var _members = <MemberData>[];

  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppConstant.appTitle),
        ),
        body: ListView.builder(
            itemCount: _members.length * 2,
            itemBuilder: (BuildContext context, int position) {
              if (position.isOdd) return Divider();

              final index = position ~/ 2;

              return _buildRow(index);
            }),
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
//      _members = JSON.decode(response.body);
//      final membersJSON = json.decode(response.body);
      final Map membersJSON = json.decode(response.body);
//      final List memberArrayJSON = json.decode(membersJSON["employee"].toString());

      print(membersJSON["employee"]);
//      print(memberArrayJSON);

      for (var memberJSON in membersJSON["employee"]) {
        final member = MemberData(memberJSON["name"]);
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
//            title:  Text("${_members[i].login", style: _biggerFont)
          title: Text("${_members[i].name}", style: _biggerFont),
//          leading:  CircleAvatar(
//              backgroundColor: Colors.green,
//              backgroundImage:  NetworkImage(_members[i].avatarUrl)
//          ),
        ));
//    return  Padding(
//        padding: const EdgeInsets.all(16.0),
//        child:  ListTile(
//          title:  Text("${_members[i].login}", style: _biggerFont),
//          leading:  CircleAvatar(
//              backgroundColor: Colors.green,
//              backgroundImage:  NetworkImage(_members[i].avatarUrl)
//          ),
//        )
//    );
  }
}
