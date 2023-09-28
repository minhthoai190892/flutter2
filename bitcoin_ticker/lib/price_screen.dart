// ignore_for_file: library_private_types_in_public_api, avoid_print, sort_child_properties_last

import 'dart:io';

import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String? selectCurrent = 'USD';
  DropdownButton<String> androidDropdownButton() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropDownItems.add(newItem);
    }
    return DropdownButton<String>(
      value: selectCurrent,
      items: dropDownItems,
      onChanged: (value) {
        setState(() {
          selectCurrent = value;
          print(selectCurrent);
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItem = [];
    for (String currency in currenciesList) {
      var item = Text(currency);
      pickerItem.add(item);
    }
    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (value) {
        print(value);
      },
      children: pickerItem,
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS?iOSPicker():androidDropdownButton(),
          ),
        ],
      ),
    );
  }
}
