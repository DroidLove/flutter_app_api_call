import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'AppConstant.dart';
import 'MemberDataSerialize.dart';
import 'YoFlutter.dart';

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
            itemCount: _members.length,
            itemBuilder: (BuildContext context, int position) {
              return _buildRow(position);
            }),
      ),
    );
  }

  Future<List<MemberDataSerialize>> _loadData() async {
    String dataURL = "https://limitless-lake-93364.herokuapp.com/hello";
    http.Response response = await http.get(dataURL);
    var _members = <MemberDataSerialize>[];

//    setState(() {
    final Map membersJSON = json.decode(response.body);
    _loading = false;
    print(membersJSON["employee"]);

    for (var memberJSON in membersJSON["employee"]) {
      final member = MemberDataSerialize.fromJson(memberJSON);
      print(member);
      _members.add(member);
    }

    return _members;
//    });
  }

  @override
  void initState() {
    super.initState();

    wrappedAPICall();
  }

  Widget _buildRow(int i) {
    return Padding(
        padding: const EdgeInsets.all(2.0),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text("${_members[i].name}", style: _biggerFont),
                subtitle:
                    Text("Age is ${_members[i].age}", style: _smallerFont),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => YoFlutter()),
                  );
                },
              )
            ],
          ),
        ));
  }

  void wrappedAPICall() async{
    var _membersAPI = await _loadData();

    setState(() {
      _members = _membersAPI;
    });
  }
}
