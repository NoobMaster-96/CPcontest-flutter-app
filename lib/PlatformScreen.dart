import 'package:url_launcher/url_launcher.dart';
import 'PlatformModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PlatformScreen extends StatefulWidget {
  final Platform platform;

  PlatformScreen({this.platform});

  @override
  PlatformScreenState createState() => PlatformScreenState();
}

class PlatformScreenState extends State<PlatformScreen> {
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
                          itemCount: widget.platform.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  15.0, 15.0, 10.0, 10.0),
                              child: Container(
                                height: 200,
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
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Text(
                                          widget.platform.data[index]["name"],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 20, 5),
                                      child: Text(
                                        'Starting Time - ' +
                                            widget.platform.data[index]
                                                ["start_time"],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 20, 5),
                                      child: Text(
                                        'Ending Time - ' +
                                            widget.platform.data[index]
                                                ["end_time"],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 5, 20, 0),
                                      child: Text(
                                        'Status',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 20, 5),
                                      child: Text(
                                        widget.platform.data[index]["status"],
                                        style: TextStyle(
                                          color: widget.platform.data[index]
                                                      ["status"] ==
                                                  "Ongoing"
                                              ? Colors.red
                                              : widget.platform.data[index]
                                                          ["status"] ==
                                                      "Upcoming"
                                                  ? Colors.green
                                                  : Colors.blue,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 5, 20, 10),
                                      child: Center(
                                        child: RaisedButton(
                                          onPressed: () async {
                                            String url = widget
                                                .platform.data[index]["url"];
                                            if (await canLaunch(url)) {
                                              await launch(url);
                                            } else {
                                              throw 'Could not launch $url';
                                            }
                                          },
                                          child: Text(
                                            'Register',
                                          ),
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
