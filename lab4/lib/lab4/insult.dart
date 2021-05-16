import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Insult {
  final String number;
  final String language;
  final String insult;
  final String created;
  final String shown;
  final String createdby;
  final String active;
  final String comment;

  Insult({
    this.number,
    this.language,
    this.insult,
    this.created,
    this.shown,
    this.createdby,
    this.active,
    this.comment,
  });

  factory Insult.fromJson(Map<String, dynamic> json) {
    return Insult(
      number: json['number'],
      language: json['language'],
      insult: json['insult'],
      created: json['created'],
      shown: json['shown'],
      createdby: json['createdby'],
      active: json['active'],
      comment: json['comment'],
    );
  }
}

Future<Insult> getNextInsult() async {
  var url = Uri.parse('https://evilinsult.com/generate_insult.php?lang=en&type=json');
  var response = await http.get(url);
  var json = jsonDecode(response.body);
  return Insult.fromJson(json);
}

var insult = getNextInsult();

class InsultPage extends StatefulWidget  {
  @override
    _InsultPageState createState() => _InsultPageState();
}

class _InsultPageState extends State<InsultPage>{
Future<Insult> futureInsult;
  Insult insult;
  bool valid = false;

  @override
  void initState() {
    super.initState();
    futureInsult = getNextInsult();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            valid ? buildInsult(insult) : FutureBuilder(
                    future: futureInsult,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        valid = true;
                        insult = snapshot.data;
                        return buildInsult(insult);
                      } else if (snapshot.hasError) {
                        return Text("Error: ${snapshot.error}");
                      }
                      return CircularProgressIndicator();
                    })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              valid = false;
              futureInsult = getNextInsult();
            });
          },
          tooltip: 'next insult',
          child: Icon(Icons.refresh)),
    );
  }

}



Widget buildInsult(Insult act) {
  return Container(
    child: Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Wrap(
          children: [
            Expanded(
              child: Text("${act.insult}",textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey, fontSize: 25)),
            ),
            Expanded(
              child: Text("\n ${act.created}", 
                      style: TextStyle(color: Colors.grey, fontSize: 15) ),
            ),
          ],
        ),
      ],
    ),
  );
}