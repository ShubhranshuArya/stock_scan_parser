import 'package:fitpage_assignment/controller/stock_scan_controller.dart';
import 'package:fitpage_assignment/view/stock_view_screen.dart';
import 'package:fitpage_assignment/widgets/stock_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// A class that builds the layout of the Main
/// Stock Scan Screen.
class StockScanScreen extends StatelessWidget {
  StockScanScreen({Key? key}) : super(key: key);

  final StockScanController stockScanController =
      Get.put(StockScanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stock Scan')),
      body: SafeArea(
        child: Obx(
          () => stockScanController.isLoading.isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 32,
                  ),
                  child: ListView.separated(
                    itemCount: stockScanController.stockScanList.length,
                    itemBuilder: (BuildContext context, int index) {
                      var model = stockScanController.stockScanList[index];
                      return GestureDetector(
                        onTap: () =>
                            Get.to(StockViewScreen(stockScanModel: model)),
                        child: StockTile(
                          stockScanModel: model,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 24,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
