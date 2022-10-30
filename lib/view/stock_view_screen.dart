import 'package:fitpage_assignment/constants/colors.dart';
import 'package:fitpage_assignment/model/stock_scan_model.dart';
import 'package:fitpage_assignment/widgets/criterion_tile.dart';
import 'package:flutter/material.dart';

/// A class that builds the layout of the selected
/// stock to view by selecting filters.
class StockViewScreen extends StatelessWidget {
  final StockScanModel stockScanModel;
  const StockViewScreen({
    Key? key,
    required this.stockScanModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(stockScanModel.name!),
        backgroundColor: stockScanModel.color == 'red' ? redColor : greenColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 32,
          ),
          child: ListView.separated(
            itemCount: stockScanModel.criteria!.length,
            itemBuilder: (BuildContext context, int index) {
              Criterion criteria = stockScanModel.criteria![index];
              return CriterionTile(criterion: criteria);
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 12,
            ),
          ),
        ),
      ),
    );
  }
}
