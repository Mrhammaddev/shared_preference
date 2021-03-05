import 'package:flutter/material.dart';
import 'package:shared_preference/Model/Video.dart';
import 'package:shared_preference/Services/database.dart';

class Person extends StatefulWidget {
  PersonModel model;
  Person({this.model});
  @override
  _PersonState createState() => _PersonState();
}

class _PersonState extends State<Person> {
  final TextEditingController fController = TextEditingController();
  final TextEditingController lController = TextEditingController();
  PersonModel model;
  DBService dbService;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbService = DBService();
    model = PersonModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            // Text(widget.model.firstName),
            TextField(
              decoration: InputDecoration(labelText: 'First Name'),
              controller: fController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Last Name'),
              controller: lController,
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  model.firstName = fController.text;
                  model.lastName = lController.text;
                  print(fController.text);
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
