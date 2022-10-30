import 'package:fitpage_assignment/view/stock_scan_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stock Scan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StockScanScreen(),
    );
  }
}
