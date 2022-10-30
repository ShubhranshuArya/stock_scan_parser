import 'package:fitpage_assignment/constants/colors.dart';
import 'package:fitpage_assignment/model/stock_scan_model.dart';
import 'package:flutter/material.dart';

/// Widget Class that builds the main
/// Stock tile.
class StockTile extends StatelessWidget {
  final StockScanModel stockScanModel;
  const StockTile({
    Key? key,
    required this.stockScanModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 68,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 16,
                decoration: BoxDecoration(
                  color: stockScanModel.color == 'red' ? redColor : greenColor,
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(12),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 260, child: Text(stockScanModel.name!)),
                  const SizedBox(height: 2),
                  Text(
                    stockScanModel.tag!,
                    style: TextStyle(
                      color:
                          stockScanModel.color == 'red' ? redColor : greenColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Icon(
            Icons.arrow_right_rounded,
            size: 40,
          ),
        ],
      ),
    );
  }
}
