import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Currency extends StatefulWidget {
  const Currency(String Country, {super.key});

  @override
  State<Currency> createState() => _CurrencyState();
}

String stringResponse = "";

@override
class _CurrencyState extends State<Currency> {
  Future apicall() async {
    http.Response response;
    response = await http.get(
        Uri.parse("https://restcountries.com/v3.1/name/India?fullText=true"));
    if (response.statusCode == 200) {
      setState(() {
        //stringResponse = response.body;
        //props = json.decode(response.body) as List;
      });
    }
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      height: 200,
      width: 300,
      decoration: BoxDecoration(color: Colors.blue),
      child: Center(
          // child: Text(mapResponse["currencies"]["name"].toString()),
          ),
    )));
  }
}
/*class Currency extends StatefulWidget {
  const Currency(String countryValue, {super.key});

  @override
  State<Currency> createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('hey'),
    );
  }
}*/
