import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const url = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '03E5EE9C-D4AC-4B1E-912E-0D7883DEFC2B';

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    String requestURL = '$url/BTC/$selectedCurrency?apikey=$apiKey';
    http.Response response = await http.get(Uri.parse(requestURL));
    if (response.statusCode == 200) {
      var decodeData = jsonDecode(response.body);
      double rate = decodeData['rate'];

      return rate;
    } else {
      return response.statusCode;
    }
  }
}
