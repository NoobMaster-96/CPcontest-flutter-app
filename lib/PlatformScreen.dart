import 'dart:convert';
import 'PlatformModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

class PlatformScreen extends StatefulWidget {
  final Platform platform;

  PlatformScreen({this.platform});

  @override
  PlatformScreenState createState() => PlatformScreenState();
}

class PlatformScreenState extends State<PlatformScreen> {
  List data;
  int n;
  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async {
    var response = await http.get(Uri.encodeFull(widget.platform.url),
        headers: {"Accept": "application/json"});
    print(response.body);

    setState(() {
      data = jsonDecode(response.body);
    });
    n = data.length;
    print(data);
    convert();
    return "Success";
  }

  void convert() {
    print(n);
    var now = new DateTime.now();
    now = now.toLocal();
    for (int i = 0; i < n; i++) {
      var start = DateTime.parse(data[i]['start_time']);
      var end = DateTime.parse(data[i]['end_time']);
      start = start.toLocal();
      end = end.toLocal();
      data[i]['start_time'] = start.toString();
      data[i]['end_time'] = end.toString();
    }
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 25.0,
                    ),
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      height: 125,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Hero(
                            tag: widget.platform.imgurl,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30.0),
                              child: Image(
                                height: 125,
                                width: 125,
                                image: AssetImage(widget.platform.imgurl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(125, 0, 0, 0),
                            child: Container(
                              child: Center(
                                child: Text(
                                  widget.platform.name,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 32,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                      ),
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: n,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  15.0, 15.0, 10.0, 10.0),
                              child: Container(
                                height: 150,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).accentColor,
                                    borderRadius: BorderRadius.circular(20.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black54,
                                        offset: Offset(0, 10.0),
                                        blurRadius: 10.0,
                                      )
                                    ]),
                                child: Column(
                                  children: <Widget>[
                                    Center(
                                      child: Text(
                                        data[index]['name'],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
