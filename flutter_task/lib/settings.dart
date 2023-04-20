import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/currency.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter_task/weather.dart';

import 'main.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  String countryValue = "";
  String? stateValue = "";
  String? cityValue = "";
  //String address = "";

  @override
  Widget build(BuildContext context) {
    GlobalKey<CSCPickerState> _cscPickerKey = GlobalKey();

    return Scaffold(
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.all(20),
              child: CSCPicker(
                layout: Layout.horizontal,
                countrySearchPlaceholder: "Country",
                stateSearchPlaceholder: "State",
                citySearchPlaceholder: "City",
                countryDropdownLabel: "Country",
                stateDropdownLabel: "State",
                cityDropdownLabel: "City",

                showStates: true,
                showCities: true,
                //flagState: CountryFlag.DISABLE,
                // onCountryChanged: (country) {},
                // onStateChanged: (state) {},
                //  onCityChanged: (city) {},
                onCountryChanged: (value) {
                  setState(() {
                    ///store value in country variable
                    if (value != null) countryValue = value;
                  });
                },
                onStateChanged: (value) {
                  setState(() {
                    ///store value in state variable
                    ///
                    if (value != null) stateValue = value;
                  });
                },

                ///triggers once city selected in dropdown
                onCityChanged: (value) {
                  setState(() {
                    ///store value in city variable
                    if (value != null) cityValue = value;
                  });
                },
              )),
          SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Weather(countryValue, cityValue!))),
            child: Text('Weather only'),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Currency(countryValue))),
            child: Text('Currency only'),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HomePage(countryValue, cityValue!))),
            child: Text('Currency and Weather'),
          ),
        ],
      ),
    );
  }
}
