import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:flutter_task/currency.dart';
import 'package:flutter_task/settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Setting(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage(String selectedValue, String cityValue, {super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ElevatedButton(
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Setting())),
            child: Icon(Icons.settings)),
        title: Text('Country details'),
      ),
      body: Container(
        child: Row(children: [
          Text('Weather'),
          SizedBox(
            width: 20,
          ),
          Text('Currency'),
        ]),
      ),
    );
  }
}
