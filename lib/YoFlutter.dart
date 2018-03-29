import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'strings.dart';
import 'member.dart';
import 'MemberData.dart';

class YoFlutter extends StatefulWidget {
  @override
  createState() => new YoFlutterState();
}

class YoFlutterState extends State<YoFlutter> {

  var _members = <MemberData>[];

  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return new Scaffold (
        appBar: new AppBar(
          title: new Text(strings.appTitle),
        ),
        body: new ListView.builder(
            itemCount: _members.length * 2,
            itemBuilder: (BuildContext context, int position) {
              if (position.isOdd) return new Divider();

              final index = position ~/ 2;

              return _buildRow(index);
            }),
        drawer: new Drawer(
          child: new Material(
            child: new ListView(
              children: <Widget>[
                new Container( // Fake a drawer header
                  color: Theme
                      .of(context)
                      .primaryColor,
                  padding: new EdgeInsets.only(
                      top: MediaQuery
                          .of(context)
                          .padding
                          .top + 16.0, bottom: 16.0),
                  child: new ListTile(
                    leading: new Icon(Icons.watch_later,
                        color: Theme
                            .of(context)
                            .primaryTextTheme
                            .title
                            .color),
                    title: new Text(
                        'Settings', style: Theme
                        .of(context)
                        .primaryTextTheme
                        .title),
                  ),
                ),
                new ListTile(
                  leading: new Icon(Icons.alarm),
                  title: new Text('Clock Type', textScaleFactor: 1.5),
                  dense: true,
                ), new ListTile(
                  leading: new Icon(Icons.adb),
                  title: new Text('Alarm', textScaleFactor: 1.5),
                  dense: true,
                )
              ],
            ),
          ),
        )
    );
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
        final member = new MemberData(
            memberJSON["name"]);
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
    return new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new ListTile(
//            title: new Text("${_members[i].login", style: _biggerFont)
          title: new Text("${_members[i].name}", style: _biggerFont),
//          leading: new CircleAvatar(
//              backgroundColor: Colors.green,
//              backgroundImage: new NetworkImage(_members[i].avatarUrl)
//          ),
        )
    );
//    return new Padding(
//        padding: const EdgeInsets.all(16.0),
//        child: new ListTile(
//          title: new Text("${_members[i].login}", style: _biggerFont),
//          leading: new CircleAvatar(
//              backgroundColor: Colors.green,
//              backgroundImage: new NetworkImage(_members[i].avatarUrl)
//          ),
//        )
//    );
  }

}