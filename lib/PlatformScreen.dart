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

    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Hero(
                  tag: widget.platform.imgurl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                          ),
                          child: Image(
                            image: AssetImage(widget.platform.imgurl),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          height: 150,
                          width: MediaQuery.of(context).size.width - 150,
                          child: Center(
                            child: Text(
                              widget.platform.name,
                              style: TextStyle(
                                fontSize: 28,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
