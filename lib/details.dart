import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  var receiveData;
  DetailsPage({this.receiveData});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircleAvatar(
          radius: 100,
          child: Image.network(receiveData['avatar'])
        ),
      ),
    );
  }
}
