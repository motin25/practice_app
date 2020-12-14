
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:practice_app/details.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var data;

  Future getData() async{
    var response =await http.get('https://reqres.in/api/users?page=2');
    setState(() {
      var decode = jsonDecode(response.body);
      data=decode['data'];
      print(data);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getData();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('flutter app'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: data==null?0:data.length,
            itemBuilder: (context,index){
            return ListTile(
              title: Text(data[index]['first_name']),

              subtitle: Text(data[index]['email']),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage(
                  receiveData: data[index],
                )));
              },
            );
            }
        )
      ),
    );
  }
}
