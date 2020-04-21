
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';


void main()=> runApp(new MaterialApp(
  home: new HomePage(),
  debugShowCheckedModeBanner: false,
));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data;
  final String url = "http://miniproject23.000webhostapp.com/api/fetch.php";

  @override
  void initState(){
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async{
    var response = await http.get(
      //Encode the url
      Uri.encodeFull(url),
      //accept json response
      headers: {"Accept": "application/json"}
    );

    print(response.body);
    setState(() {
      var convertDataToJson = json.decode(response.body);
      data = convertDataToJson['results'];
    });
    return "Success";
  }

    @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
      title: new Center (child: new Text("Black Box Data")),
      ),
    body: new ListView.builder(
      padding: EdgeInsets.all(12.0),
      itemCount: data==null?0:data.length,
      itemBuilder: (BuildContext context, int index){
        return new Container(
          child : new Center(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                  new Card(
                    color: Colors.transparent,
                    child: new Column(
                    
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                       child :new Text("X angle: "+data[index]['X_angle']),
                       color: Colors.white60,
                       padding: EdgeInsets.all(5.0),
                       width: 200.0,
                       ),
                        new Container(
                       child : new Text("Y angle: "+data[index]['Y_angle']),
                       color: Colors.white60,
                       padding: EdgeInsets.all(5.0),
                       width: 200.0,
                       ),
                        new Container(
                       child :new Text("Z angle: "+data[index]['Z_angle']),
                       color: Colors.white60,
                       padding: EdgeInsets.all(5.0),
                       width: 200.0,
                       ),
                        new Container(
                       child :new Text("Time: "+data[index]['time']),
                       color: Colors.white60,
                       padding: EdgeInsets.all(5.0),
                       width: 200.0,
                       ),
                      
                  
                       
                    ],
                    ),
                  )
              ],
            ),
          ),
        );
      },
    ),
    backgroundColor: Colors.black45,
    );
  }
}