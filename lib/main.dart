import 'dart:convert';
import 'package:tugas_akhir/model.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<IPModel> future() async {
    http.Response response =
        await http.get('https://db.ygoprodeck.com/api/v5/cardinfo.php');
    if (response.statusCode == 200) {
      return IPModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: FutureBuilder(
              future: future(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Text(
                      '${snapshot.data.id}\n${snapshot.data.name}\n${snapshot.data.type}\n${snapshot.data.desc}\n${snapshot.data.atk}\n${snapshot.data.def}\n${snapshot.data.level}\n${snapshot.data.race}\n${snapshot.data.attribute}\n${snapshot.data.card_images}\n${snapshot.data.card_prices}');
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                } else {
                  return CircularProgressIndicator();
                }
              }),
        ),
      ),
    );
  }
}
