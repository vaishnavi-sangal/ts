import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

class Weather extends StatefulWidget {
  const Weather(String selectedValue, String cityValue, {super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  WeatherFactory wf = new WeatherFactory("c5f0b37b3616ffecc653a2ae317ce178");
  String key = 'c5f0b37b3616ffecc653a2ae317ce178';
  late WeatherFactory ws;
  String cityName = 'Shamli';
  List<Weather> _data = [];

  @override
  void initState() {
    super.initState();
    ws = new WeatherFactory(key);
  }

  void _saveLat(String input) {
    cityName = double.tryParse(input) as String;
    print(cityName);
  }

  Widget _coordinateInputs() {
    return Row(children: <Widget>[
      Expanded(
        child: Container(
            margin: EdgeInsets.all(5),
            child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter city'),
                onChanged: _saveLat,
                onSubmitted: _saveLat)),
      ),
    ]);
  }

  void queryWeather() async {
    /// Removes keyboard
    FocusScope.of(context).requestFocus(FocusNode());

    Weather w = (await ws.currentWeatherByCityName(cityName)) as Weather;
  }

  Widget contentFinishedDownload() {
    return Center(
      child: ListView.separated(
        itemCount: _data.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_data[index].toString()),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
    );
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather Example App'),
        ),
        body: Column(
          children: <Widget>[
            _coordinateInputs(),
            Text(
              'Output:',
              style: TextStyle(fontSize: 20),
            ),
            Divider(
              height: 20.0,
              thickness: 2.0,
            ),
            Expanded(child: contentFinishedDownload())
          ],
        ),
      ),
    );
  }
}
