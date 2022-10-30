import 'package:fitpage_assignment/constants/strings.dart';
import 'package:fitpage_assignment/model/stock_scan_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();

  /// Function to 'get' data from an end-point
  /// using http.
  Future<List<StockScanModel>?> getStockData() async {
    try {
      var url = Uri.parse(stockScanEndPoint);
      var response = await client.get(url);
      if (response.statusCode == 200) {
        String jsonString = response.body;
        return stockScanModelFromJson(jsonString);
      }
    } catch (error) {
      debugPrint(error.toString());
    }
    return null;
  }
}
